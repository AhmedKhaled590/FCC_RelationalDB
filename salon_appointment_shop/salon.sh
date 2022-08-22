#!/bin/bash

PSQL="psql -X --username=freecodecamp --dbname=salon --tuples-only -c"

MAIN_MENU(){
  if [[ $1 ]]
  then
    echo -e "\n$1"
  else
    echo -e "\nWelcome to My Salon, how can I help you?\n"
  fi
  
  echo -e "\n~~~~~ MY SALON ~~~~~\n"

  SERVICES=$($PSQL "select service_id,name from services;")
  if [[ -z $SERVICES ]]
  then
    echo -e "\nNo Services Available\n"
  else
    echo "$SERVICES" | while read SERVICE_ID bar NAME
    do
      echo "$SERVICE_ID) $NAME"
    done

    read SERVICE_ID_SELECTED
    if [[ ! $SERVICE_ID_SELECTED =~ ^[0-9]+$ ]]
    then
      MAIN_MENU "Please Enter Service ID As Integer Input."
    else
      SERVICE=$($PSQL "select name from services where service_id = $SERVICE_ID_SELECTED;")
      if [[ -z $SERVICE ]]
      then
        MAIN_MENU "I could not find that service. What would you like today?"
      else
        echo -e "\nWhat's your phone number?"
        read CUSTOMER_PHONE
        CUSTOMER=$($PSQL "select name from customers where phone='$CUSTOMER_PHONE';")
        if [[ -z $CUSTOMER ]]
        then
          echo -e "\nI don't have a record for that phone number, what's your name?"
          read CUSTOMER_NAME
          INSERT_CUSTOMER_RESULT=$($PSQL "insert into customers (name,phone) values ('$CUSTOMER_NAME','$CUSTOMER_PHONE');")
        fi
        CUSTOMER_NAME=$($PSQL "select name from customers where phone='$CUSTOMER_PHONE';")
        echo -e "\nWhat time would you like your $(echo $SERVICE | sed 's/^ *| *$//g'), $(echo $CUSTOMER_NAME | sed 's/^ *| *$//g')?"
        read SERVICE_TIME
        CUSTOMER_ID=$($PSQL "select customer_id from customers where phone='$CUSTOMER_PHONE';")
        INSERT_APPOINTMENT_RESULT=$($PSQL "insert into appointments(customer_id,service_id,time) values ($CUSTOMER_ID,$SERVICE_ID_SELECTED,'$SERVICE_TIME');")
        echo -e "I have put you down for a$SERVICE at $SERVICE_TIME,$CUSTOMER_NAME." 
      fi
    fi
  fi

}

MAIN_MENU