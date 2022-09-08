#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.
echo -e "\n~~ Using games.csv ~~\n"

# Truncate tables before each test run
echo $($PSQL "TRUNCATE teams, games")

cat games.csv | while IFS="," read YEAR ROUND WINNER OPPONENT WINNER_GOALS OPPONENT_GOALS

do
  # Start insert team data
  if [[ $YEAR != year ]]
  then
    # get team id
    TEAM_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$OPPONENT'")
    
    # if not found
    if [[ -z $TEAM_ID ]]
    then
      # insert team
      
      INSERT_TEAM_RESULT=$($PSQL "INSERT INTO teams(name) VALUES('$OPPONENT')")
     
      : 'if [[ $INSERT_TEAM_RESULT == 'INSERT 0 1' ]]
      then 
        echo Inserted into teams, $OPPONENT
      fi '
    fi

    WINNER_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$WINNER'")

    # if not found
    if [[ -z $WINNER_ID ]]
    then
      # insert team
      INSERT_TEAM_RESULT=$($PSQL "INSERT INTO teams(name) VALUES('$WINNER')")
     
      : 'if [[ $INSERT_TEAM_RESULT == 'INSERT 0 1' ]]
      then  
        #echo Inserted into teams, $WINNER
      fi '    
    fi
  fi
  # end insert team data
done

cat games.csv | while IFS="," read YEAR ROUND WINNER OPPONENT WINNER_GOALS OPPONENT_GOALS

do
  if [[ $YEAR != year ]]
  then
    #echo $YEAR $ROUND $WINNER $OPPONENT $WINNER_GOALS $OPPONENT_GOALS
    # get winner and opponent ids
    W_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$WINNER'")
    O_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$OPPONENT'")
    # echo $W_ID $O_ID
    if [[ $W_ID -gt 1 && $O_ID -gt 1 ]]
    then
      INSERT_RESULT=$($PSQL "INSERT INTO games(year, round, winner_id, opponent_id, winner_goals, opponent_goals) values('$YEAR', '$ROUND', '$W_ID', '$O_ID', '$WINNER_GOALS', '$OPPONENT_GOALS')")

      : 'if [[ $INSERT_RESULT == 'INSERT 0 1' ]]
      then  
        echo Inserted into games, $WINNER v $OPPONENT : $WINNER_GOALS : $OPPONENT_GOALS
      fi '
    fi
  fi 
done 