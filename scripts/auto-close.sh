#!/bin/sh

IFS=$'\n'  # set Internal Field Separator as a linebreak
MAX_ATTEMPTS=3
SLEEP_TIME=5 # wait time in sec.

for app in $(osascript -e 'tell application "System Events" to get the name of every application process whose background only is false'); do
  if [ "$app" != "Finder" ]; then
    echo " Attempting to close $app..."
    
    attempt=1  # Init. attempt counter
    success=false
    
    while [ $attempt -le $MAX_ATTEMPTS ]; do
      osascript -e "tell application \"$app\" to quit" 2>/tmp/osascript_error.log
      exit_code=$?  # Store the return value of osascript

      if [ $exit_code -eq 0 ]; then
        echo "$app was closed successfully."
        success=true
        break
      else
        echo "Error closing $app. Attempt $attempt of $MAX_ATTEMPTS." >&2
        error_message=$(< /tmp/osascript_error.log)
        echo "Details: $error_message" >&2
        
        attempt=$((attempt + 1))
        sleep $SLEEP_TIME
      fi
    done

      # Check if all attempts failed
    if [ "$success" = false ]; then
      echo "Error: $app could not be closed after $MAX_ATTEMPTS attempts." >&2
    fi
  fi
done
