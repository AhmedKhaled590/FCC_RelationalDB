#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

echo "$($PSQL "truncate games,teams;")"

# Do not change code above this line. Use the PSQL variable above to query your database.
cat games.csv | while IFS="," read year round winner opponent winner_goals opponent_goals
do
  if [[ $year != "year" ]]
  then
    W_TEAM_ID=$($PSQL "select team_id from teams where name='$winner'")
    if [[ -z $W_TEAM_ID ]]
    then
      INSERT_TEAM_RESULT=$($PSQL "insert into teams(name) values('$winner');")
      echo $INSERT_TEAM_RESULT
      W_TEAM_ID=$($PSQL "select team_id from teams where name='$winner'")
    fi

    O_TEAM_ID=$($PSQL "select team_id from teams where name='$opponent'")
    if [[ -z $O_TEAM_ID ]]
    then
      INSERT_TEAM_RESULT=$($PSQL "insert into teams(name) values('$opponent');")
      echo $INSERT_TEAM_RESULT
      O_TEAM_ID=$($PSQL "select team_id from teams where name='$opponent'")      
    fi
    
    INSERT_GAME_RESULT=$($PSQL "INSERT INTO GAMES (year,round,winner_id,opponent_id,winner_goals,opponent_goals) values ($year,'$round',$W_TEAM_ID,$O_TEAM_ID,$winner_goals,$opponent_goals);")
    echo $INSERT_GAME_RESULT
  fi
done