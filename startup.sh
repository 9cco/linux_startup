#!/bin/bash

# We want the script to run `sudo apt update && sudo apt upgrade -y` upon boot if there has been n days since last time.

# Constants
DATE_FILE="$HOME/Scripts/Shell/Startup/last_run.txt" # location of memory of the day the script was run last.
N=4 # maximum number of days allowed for the delay.

# This section sets day_diff which is the difference between the time "now" and when the script was last run.
# First we check if there is a file containing the date of the last run
if [ -f "$DATE_FILE" ]; then
    last_run=$(date -f $DATE_FILE +%s)
    now=$(date +%s)
    day_diff=$(((now - last_run)/3600/24))
    echo $day_diff
else
    echo "Could not find file $DATE_FILE. Assuming this is first run."
    day_diff=$((N+1))
    # If there is no last_run file, then we create it
    #date +%Y-%m-%d > $DATE_FILE
fi

# If the day difference is larger than the accepted delay (N), then we run the command.
if [[ $day_diff -gt $N ]]; then
    sudo apt update && sudo apt upgrade -y
fi
