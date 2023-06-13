#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=periodic_table -t --no-align -c"

if [ -z $1 ]
then
  echo "Please provide an element as an argument."
  exit
fi

if [ $(($1)) == $1 ]
then
  result="$($PSQL "SELECT * FROM properties LEFT JOIN elements 
    ON properties.atomic_number = elements.atomic_number
    LEFT JOIN types ON properties.type_id = types.type_id
    WHERE elements.atomic_number='$1';")"
else
  result="$($PSQL "SELECT * FROM properties LEFT JOIN elements 
  ON properties.atomic_number = elements.atomic_number
  LEFT JOIN types ON properties.type_id = types.type_id
  WHERE elements.symbol='$1' OR elements.name='$1';")"
fi

if [ -z $result ]
then
  echo "I could not find that element in the database."
  exit
fi

IFS="|"
read atomic_number atomic_mass melting_point boiling_point type_id atomic_number_element symbol name type_type_id type_name <<< $result

echo "The element with atomic number $atomic_number is $name ($symbol). It's a $type_name, with a mass of $atomic_mass amu. $name has a melting point of $melting_point celsius and a boiling point of $boiling_point celsius."
