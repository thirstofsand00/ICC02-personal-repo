#!/bin/bash

LOG_FILE="./Logger Entry.log"
#creation of the log file

#instead of using:
#date +"%Y-%m-%d %H:%M:%S"
#echo "User: $USER" 
#echo "Script executed successfully" 

DATE=$(date +"%Y-%m-%d %H:%M:%S")


echo "[$DATE] User: $USER - Log entry: Script executed successfully " >> "$LOG_FILE"
