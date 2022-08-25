#!/bin/bash
RANDOM_GENERATED_NUMBER=$(( $RANDOM % 1000 + 1 ))
echo $RANDOM_GENERATED_NUMBER

PSQL="psql -X --username=freecodecamp --dbname=number_guess --tuples-only -c"



echo "Enter your username:"
read USERNAME_ENTERED

USER=$($PSQL "select username,games_played,best_guess from users where username='$USERNAME_ENTERED';")

if [[ -z $USER ]]
then
  USER=$($PSQL "insert into users (username,games_played,best_guess) values ('$USERNAME_ENTERED',0,0);")
  echo "Welcome, $USERNAME_ENTERED! It looks like this is your first time here."
else
    echo "$USER" | while read username BAR games_played BAR best_guess
    do
        echo -e "\nWelcome back, $username! You have played $games_played games, and your best game took $best_guess guesses."
    done
fi

echo "Guess the secret number between 1 and 1000:"
read NUMBER_ENTERED

number_of_guesses=1
while [[ $NUMBER_ENTERED != $RANDOM_GENERATED_NUMBER ]]
do
    if [[ ! $NUMBER_ENTERED =~ ^[0-9]+$ ]]
    then
        echo "That is not an integer, guess again:"
        read NUMBER_ENTERED
        continue
    fi
    if [[ $NUMBER_ENTERED -lt $RANDOM_GENERATED_NUMBER ]]
    then
        echo "It's lower than that, guess again:"
    elif [[ $NUMBER_ENTERED -gt $RANDOM_GENERATED_NUMBER ]]
    then
        echo "It's higher than that, guess again:"
    fi

    number_of_guesses=$(( $number_of_guesses+1 ))
    read NUMBER_ENTERED
done
echo  "You guessed it in $number_of_guesses tries. The secret number was $RANDOM_GENERATED_NUMBER. Nice job!"


USER=$($PSQL "select username,games_played,best_guess from users where username='$USERNAME_ENTERED';")

echo "$USER" | while read username BAR games_played BAR best_guess
do

    if [[ $number_of_guesses -lt $best_guess || $best_guess -eq 0 ]]
    then
        best_guess=$number_of_guesses
    fi

    update_result=$($PSQL "update users set best_guess=$best_guess where username='$USERNAME_ENTERED';")
    update_result=$($PSQL "update users set games_played=$(( $games_played+1 )) where username='$USERNAME_ENTERED';")
done