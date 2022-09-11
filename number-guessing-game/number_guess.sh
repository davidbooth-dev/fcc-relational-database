#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=number_guess -t --tuples-only -c"

RND=$(( RANDOM % 1000 ))

MAIN(){
  # get username
  GET_USERNAME
  
  # start guessing
  SECRET_NUMBER=$RND
  NUMBER_OF_GUESSES=0
  echo "Guess the secret number between 1 and 1000:"
  echo "$SECRET_NUMBER"
  while [[ true ]]
  do
    read GUESS

    (( NUMBER_OF_GUESSES++ ))
    if [[ ! $GUESS =~ ^[0-9]{1,4}+$ ]]
    then
      echo "That is not an integer, guess again:"
    elif [[ $GUESS -gt $SECRET_NUMBER ]]
    then
      echo "It's lower than that, guess again:"
    elif [[ $GUESS -lt $SECRET_NUMBER ]]
    then
      echo "It's higher than that, guess again:"
    elif [[ $GUESS -eq $SECRET_NUMBER ]]
    then
      echo "You guessed it in $NUMBER_OF_GUESSES tries. The secret number was $SECRET_NUMBER. Nice job!"
      SAVE_INFO
      break      
    fi
  done
}

# get users name and inser to db if new
GET_USERNAME(){
  echo "Enter your username:"
  read USERNAME

  if [[ ! $USERNAME =~ ^[A-Z][a-z]+$ && ! ${#USERNAME} -le 22 ]]
  then
    GET_USERNAME
  fi

  # check db for existing user
  RESULT=$($PSQL "SELECT * FROM users WHERE name='$USERNAME'")

  # if not found
  if [[ -z $RESULT ]]
  then
    echo "Welcome, $USERNAME! It looks like this is your first time here."

    # insert new user
    INSERT_RESULT=$($PSQL "INSERT INTO users(name, games_played, best_game) VALUES('$USERNAME', 0, 0)")
  else
    echo "$RESULT" | while read ID BAR NAME BAR GAMES_PLAYED BAR BEST_GAME
    do
      echo "Welcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
    done
  fi
}

SAVE_INFO(){

  INFO=$($PSQL "SELECT games_played, best_game FROM users WHERE name='$USERNAME'")
  echo "$INFO" | while read -a RECORD
  do
    GP=${RECORD[0]}
    (( GP++ ))
    BEST=${RECORD[2]}
   
    if [[ $NUMBER_OF_GUESSES -lt $BEST || $BEST -eq 0 ]]
    then
      BEST=$NUMBER_OF_GUESSES
    fi
    
    # save record
    UPDATE_RESULT=$($PSQL "UPDATE users set games_played=$GP, best_game=$BEST WHERE name='$USERNAME'")
  done
}

MAIN