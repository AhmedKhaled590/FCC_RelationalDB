#!/bin/bash

PSQL="psql -X --username=freecodecamp --dbname=periodic_table --tuples-only -c"

if [[ -z $1 ]]
then
  echo 'Please provide an element as an argument.'
  else
  
  ## check if $1 is number
  if [[ $1 =~ ^[0-9]+$ ]]
  then
    atomic_number=$1
    element_data=$($PSQL "select p.atomic_number,name,symbol,type,atomic_mass,melting_point_celsius,boiling_point_celsius from properties as p inner join elements as e using(atomic_number) inner join types using(type_id) where atomic_number=$atomic_number;")
    if [[ -z $element_data ]]
    then
      echo "I could not find that element in the database."
    else
      echo "$element_data" | while read atomic_number bar name bar symbol bar element_type bar atomic_mass bar melting_point_celsius bar boiling_point_celsius
      do
        echo "The element with atomic number $atomic_number is $name ($symbol). It's a $element_type, with a mass of $atomic_mass amu. $name has a melting point of $melting_point_celsius celsius and a boiling point of $boiling_point_celsius celsius."
      done
    fi
  fi

  ## check if $1 is atomic_symbol
  if [[ $1 =~ ^[A-Za-z]{1,2}$ ]]
  then
    atomic_symbol=$1
    element_data=$($PSQL "select p.atomic_number,name,symbol,type,atomic_mass,melting_point_celsius,boiling_point_celsius from properties as p inner join elements as e using(atomic_number) inner join types using(type_id) where symbol='$atomic_symbol';")
    if [[ -z $element_data ]]
    then
      echo "I could not find that element in the database."
    else
      echo "$element_data" | while read atomic_number bar name bar symbol bar element_type bar atomic_mass bar melting_point_celsius bar boiling_point_celsius
      do
        echo "The element with atomic number $atomic_number is $name ($symbol). It's a $element_type, with a mass of $atomic_mass amu. $name has a melting point of $melting_point_celsius celsius and a boiling point of $boiling_point_celsius celsius."
      done
    fi
  else
    ## check if $1 is name
    if [[ $1 =~ ^[A-Za-z] ]]
    then
      atomic_name=$1
      element_data=$($PSQL "select p.atomic_number,name,symbol,type,atomic_mass,melting_point_celsius,boiling_point_celsius from properties as p inner join elements as e using(atomic_number) inner join types using(type_id) where name='$atomic_name';")
      if [[ -z $element_data ]]
      then
        echo "I could not find that element in the database."
      else
        echo "$element_data" | while read atomic_number bar name bar symbol bar element_type bar atomic_mass bar melting_point_celsius bar boiling_point_celsius
        do
          echo "The element with atomic number $atomic_number is $name ($symbol). It's a $element_type, with a mass of $atomic_mass amu. $name has a melting point of $melting_point_celsius celsius and a boiling point of $boiling_point_celsius celsius."
        done
      fi
    fi
  fi
  
fi