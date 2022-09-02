#! /bin/bash

PSQL="psql --username=freecodecamp --dbname=worldcup --no-align --tuples-only -c"

# Do not change code above this line. Use the PSQL variable above to query your database.

echo -e "\nTotal number of goals in all games from winning teams:"
echo "$($PSQL "SELECT SUM(winner_goals) FROM games")"
# done 68

echo -e "\nTotal number of goals in all games from both teams combined:"
echo "$($PSQL "SELECT SUM(winner_goals + opponent_goals) from games")"
# done 90

echo -e "\nAverage number of goals in all games from the winning teams:"
echo "$($PSQL "SELECT AVG(winner_goals) FROM games")"
# done 2.1250000000000000

echo -e "\nAverage number of goals in all games from the winning teams rounded to two decimal places:"
echo "$($PSQL "SELECT ROUND(AVG(winner_goals), 2) FROM games")"
# done 2.13

echo -e "\nAverage number of goals in all games from both teams:"
echo "$($PSQL "SELECT AVG(winner_goals + opponent_goals) FROM games")"
# done

echo -e "\nMost goals scored in a single game by one team:"
echo "$($PSQL "SELECT MAX(winner_goals) FROM games")"
# done 7

echo -e "\nNumber of games where the winning team scored more than two goals:"
echo "$($PSQL "SELECT COUNT(*) FROM games WHERE winner_goals > 2")"
#done 6

echo -e "\nWinner of the 2018 tournament team name:"
echo "$($PSQL "SELECT name FROM teams INNER JOIN games ON teams.team_id = games.winner_id WHERE year=2018 AND round='Final'")"
# done 1 row

echo -e "\nList of teams who played in the 2014 'Eighth-Final' round:"
echo "$($PSQL "SELECT name from games inner join teams on games.winner_id=teams.team_id OR games.opponent_id=teams.team_id WHERE year=2014 AND round='Eighth-Final' ORDER BY name")"
# done 16 rows

echo -e "\nList of unique winning team names in the whole data set:"
echo  "$($PSQL "SELECT DISTINCT(name) FROM teams RIGHT JOIN games on teams.team_id=games.winner_id ORDER BY name")"
# done 13 rows

echo -e "\nYear and team name of all the champions:"
echo "$($PSQL "SELECT year, name from games INNER JOIN teams ON games.winner_id=teams.team_id WHERE round='Final' ORDER BY name DESC")"
# done 2 rowa

echo -e "\nList of teams that start with 'Co':"
echo "$($PSQL "SELECT name FROM teams WHERE name LIKE 'Co%'")"
# done 2 rows