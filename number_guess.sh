#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

# Generate random number
SECRET_NUMBER=$(( RANDOM % 1000 + 1 ))

# Prompt for username
echo "Enter your username:"
read USERNAME

# Check if user exists
USER_INFO=$($PSQL "SELECT games_played, best_game FROM users WHERE username='$USERNAME'")

if [[ -z $USER_INFO ]]
then
  echo "Welcome, $USERNAME! It looks like this is your first time here."
  $PSQL "INSERT INTO users(username) VALUES('$USERNAME')"
else
  # Extract games_played and best_game from the user info
  IFS='|' read GAMES_PLAYED BEST_GAME <<< "$USER_INFO"
  echo "Welcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
fi

echo "Guess the secret number between 1 and 1000:"

GUESS_COUNT=0

while true
do
  read GUESS
  if [[ ! $GUESS =~ ^[0-9]+$ ]]
  then
    echo "That is not an integer, guess again:"
  else
    GUESS_COUNT=$((GUESS_COUNT + 1))
    if [[ $GUESS -eq $SECRET_NUMBER ]]
    then
      echo "You guessed it in $GUESS_COUNT tries. The secret number was $SECRET_NUMBER. Nice job!"

      # Update games played and best game if applicable
      if [[ -z $USER_INFO ]]
      then
        $PSQL "UPDATE users SET games_played=1, best_game=$GUESS_COUNT WHERE username='$USERNAME'"
      else
        # Increment the number of games played
        UPDATED_GAMES_PLAYED=$((GAMES_PLAYED + 1))
        if [[ $GUESS_COUNT -lt $BEST_GAME ]]
        then
          $PSQL "UPDATE users SET games_played=$UPDATED_GAMES_PLAYED, best_game=$GUESS_COUNT WHERE username='$USERNAME'"
        else
          $PSQL "UPDATE users SET games_played=$UPDATED_GAMES_PLAYED WHERE username='$USERNAME'"
        fi
      fi
      break
    elif [[ $GUESS -gt $SECRET_NUMBER ]]
    then
      echo "It's lower than that, guess again:"
    else
      echo "It's higher than that, guess again:"
    fi
  fi
done