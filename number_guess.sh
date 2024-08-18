#!/bin/bash

# Connect to the database
PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

# Prompt for username
echo "Enter your username:"
read USERNAME

# Check if username exists in the database
USER_QUERY=$($PSQL "SELECT user_id, games_played, best_game FROM users WHERE username='$USERNAME'")

if [[ -z $USER_QUERY ]]; then
  # New user
  echo "Welcome, $USERNAME! It looks like this is your first time here."
  # Insert new user into the database
  INSERT_USER_RESULT=$($PSQL "INSERT INTO users(username) VALUES('$USERNAME')")
  USER_ID=$($PSQL "SELECT user_id FROM users WHERE username='$USERNAME'")
else
  # Existing user
  IFS="|" read USER_ID GAMES_PLAYED BEST_GAME <<< $USER_QUERY
  echo "Welcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
fi

# Generate a random number between 1 and 1000
SECRET_NUMBER=$(( RANDOM % 1000 + 1 ))

# Initialize guess counter
NUMBER_OF_GUESSES=0

# Start the guessing game
echo "Guess the secret number between 1 and 1000:"
while true; do
  read GUESS
  
  # Check if input is an integer
  if ! [[ $GUESS =~ ^[0-9]+$ ]]; then
    echo "That is not an integer, guess again:"
    continue
  fi

  # Increment the guess counter
  ((NUMBER_OF_GUESSES++))

  # Compare the guess to the secret number
  if [[ $GUESS -lt $SECRET_NUMBER ]]; then
    echo "It's higher than that, guess again:"
  elif [[ $GUESS -gt $SECRET_NUMBER ]]; then
    echo "It's lower than that, guess again:"
  else
    echo "You guessed it in $NUMBER_OF_GUESSES tries. The secret number was $SECRET_NUMBER. Nice job!"

    # Update the user's game stats
    UPDATE_USER_RESULT=$($PSQL "UPDATE users SET games_played = games_played + 1 WHERE user_id = $USER_ID")
    
    # Update the best game if this is the best
    if [[ -z $BEST_GAME || $NUMBER_OF_GUESSES -lt $BEST_GAME ]]; then
      UPDATE_BEST_GAME_RESULT=$($PSQL "UPDATE users SET best_game = $NUMBER_OF_GUESSES WHERE user_id = $USER_ID")
    fi

    # Insert the game record
    INSERT_GAME_RESULT=$($PSQL "INSERT INTO games(user_id, guesses, secret_number) VALUES($USER_ID, $NUMBER_OF_GUESSES, $SECRET_NUMBER)")
    
    break
  fi
done