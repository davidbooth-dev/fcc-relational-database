#!/bin/bash
PSQL="psql -X --username=freecodecamp --dbname=periodic_table --tuples-only -c"

#echo -e "\n ~~ Periodic Table Database ~~"

MAIN(){
  if [[ ! $1 ]]
  then
    echo "Please provide an element as an argument."
    exit 0
  fi 
  
  # get value of argument: 1-10, A-Zz, Name
  GET_ELEMENT $1
  if [[ -z $ELEMENT ]]
  then
    echo "I could not find that element in the database."
  else
    # get properties for element
    # output the result
    echo "$ELEMENT" | while read AN BAR SYMBOL BAR NAME BAR WEIGHT BAR MP BAR BP
    do
      echo "The element with atomic number $AN is $NAME ($SYMBOL). It's a nonmetal, with a mass of $WEIGHT amu. $NAME has a melting point of $MP celsius and a boiling point of $BP celsius."
    done
  fi
}

GET_ELEMENT(){
  CS="SELECT e.atomic_number AS an, symbol, name, atomic_mass AS mass, melting_point_celsius AS mp, boiling_point_celsius AS bp FROM elements AS e "
  CS+="INNER JOIN properties using(atomic_number) INNER JOIN types USING(type_id)"

  if [[ $1 =~ ^[1-9]|[10]$ ]]
  then
    ELEMENT=$($PSQL "$CS WHERE e.atomic_number=$1")
  elif [[ $1 =~ ^[A-Z][a-z]?$ ]]
  then
    ELEMENT=$($PSQL "$CS WHERE symbol='$1'")
  elif [[ $1 =~ ^[A-Za-z]+$ ]]
  then
    ELEMENT=$($PSQL "$CS WHERE name='$1'")
  else
    ELEMENT=''
  fi
}

MAIN $1