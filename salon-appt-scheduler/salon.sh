#!/bin/bash


PSQL="psql -X --username=freecodecamp --dbname=salon --tuples-only -c"

# ~~~~~ MY SALON ~~~~~

MAIN_MENU(){
  if [[ $1 ]]
  then
    echo -e "\n$1"
  fi

  echo -e "\nWelcome to My Salon, how can I help you?\n"

  SERVICES=$($PSQL "SELECT * FROM services ORDER By service_id")

  echo "$SERVICES" | while read SERVICE_ID BAR SERVICE_NAME
  do
    echo "$SERVICE_ID) $SERVICE_NAME"
  done
  echo "7) Exit"

  read SERVICE_ID_SELECTED

  case $SERVICE_ID_SELECTED in
    1) ADD_APPOINTMENT 1 ;;
    2) ADD_APPOINTMENT 2 ;;
    3) ADD_APPOINTMENT 3 ;;
    4) ADD_APPOINTMENT 4 ;;
    5) ADD_APPOINTMENT 5 ;;
    6) ADD_APPOINTMENT 6 ;;
    7) EXIT ;;
    *) MAIN_MENU "Please enter a valid option." ;;
  esac
}

ADD_APPOINTMENT(){
  if [[ ! $1 ]]
  then
    MAIN_MENU
  else
    SERVICE_ID_SELECTED=$1;

    SERVICE_NAME=$($PSQL "SELECT name FROM services WHERE service_id=$SERVICE_ID_SELECTED") 
    
    # if not a service
    if [[ -z $SERVICE_NAME ]]
    then
      MAIN_MENU "That service is unavailable"
    else
      # get customer phone
      echo -e "\nWhat's your phone number?"
      read CUSTOMER_PHONE

      CUSTOMER_ID=$($PSQL "SELECT customer_id from customers WHERE phone='$CUSTOMER_PHONE'")

      # if customer doesn't exist
      if [[ -z $CUSTOMER_ID ]]
      then
        # get new customer name
        echo -e "\nI don't have a record for that phone number, what's your name?"
        read CUSTOMER_NAME

        # insert new customer
        INSERT_CUSTOMER_RESULT=$($PSQL "INSERT INTO customers(name, phone) VALUES('$CUSTOMER_NAME', '$CUSTOMER_PHONE')")
        
        # get customer_id
        CUSTOMER_ID=$($PSQL "SELECT customer_id from customers WHERE phone='$CUSTOMER_PHONE'")
      fi
      
      # get customer name
      CUSTOMER_NAME=$($PSQL "SELECT name from customers WHERE phone='$CUSTOMER_PHONE'")
      
      # ask for appointment time
      echo -e "\nWhat time would you like your $SERVICE_NAME, $CUSTOMER_NAME?"
      read SERVICE_TIME

      # insert appointment
      RESULT=$($PSQL "INSERT INTO appointments(customer_id, service_id, time) VALUES($CUSTOMER_ID, $SERVICE_ID_SELECTED, '$SERVICE_TIME')")
      
      # get appointment info
      #APPOINTMENT_INFO=$($PSQL "SELECT size, type FROM bikes WHERE bike_id = $BIKE_ID_TO_RENT")
      APPOINTMENT_INFO_FORMATTED=$(echo $SERVICE_NAME | sed 's/ |/"/')
        
      # send to main menu
      echo "I have put you down for a $APPOINTMENT_INFO_FORMATTED at $SERVICE_TIME, $(echo $CUSTOMER_NAME | sed -r 's/^ *| *$//g')."
    fi
  fi
}

CANCEL_TASK(){
  echo -e "\nCancel Task"

  # send to main menu
  MAIN_MENU
}

EXIT(){
  echo -e "\nThank you for stopping in.\n"
}

MAIN_MENU