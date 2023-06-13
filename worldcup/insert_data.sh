#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t -q --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t -q --no-align -c"
fi

echo $($PSQL "TRUNCATE games, teams;")

skip=1
cat games.csv | while IFS=',' read year round winner opponent winner_goals opponent_goals
do
  if ((skip))
  then
    ((skip--))
  else
    winnerID=$($PSQL "SELECT team_id FROM teams WHERE name='$winner';")
    opponentID=$($PSQL "SELECT team_id FROM teams WHERE name='$opponent';")

    if [ -z $winnerID ]
    then
      winnerID=$($PSQL "INSERT INTO teams (name) SELECT '$winner' WHERE NOT EXISTS (SELECT name FROM teams WHERE name='$winner') RETURNING team_id;")
    fi

    if [ -z $opponentID ]
    then
      opponentID=$($PSQL "INSERT INTO teams (name) SELECT '$opponent' WHERE NOT EXISTS (SELECT name FROM teams WHERE name='$opponent') RETURNING team_id;")
    fi

    $($PSQL "INSERT INTO games (year, round, winner_id, opponent_id, winner_goals, opponent_goals) 
      VALUES ($year, '$round', $winnerID, $opponentID, $winner_goals, $opponent_goals);")
  fi
done
