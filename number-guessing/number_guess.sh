#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -q -c"

answer=$((1 + $RANDOM % 1000))

echo "Enter your username:"
read username

userInfo=$($PSQL "SELECT username FROM games WHERE username='$username';")

if [ -z $userInfo ]
then
  echo "Welcome, $username! It looks like this is your first time here."
else 
  games_played=$($PSQL "SELECT COUNT(*) FROM games WHERE username='$username';")
  best_game=$($PSQL "SELECT MIN(tries) FROM games WHERE username='$username';")
  echo "Welcome back, $username! You have played $games_played games, and your best game took $best_game guesses."
fi

echo "Guess the secret number between 1 and 1000:"

guess=9999
tries=0

while (( guess != answer ))
do 
  read guess
  ((tries++))

  if [[ $((guess)) != $guess ]]
  then
    echo "That is not an integer, guess again:"
    guess=9999
    continue
  fi

  if (( guess < answer ))
  then
    echo "It's higher than that, guess again:"
  fi

  if (( guess > answer ))
  then
    echo "It's lower than that, guess again:"
  fi
done

$($PSQL "INSERT INTO games (username, tries) VALUES ('$username', $tries)")

echo "You guessed it in $tries tries. The secret number was $answer. Nice job!"
