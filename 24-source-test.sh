#!/bin/bash

source ./common.sh

SOURCE_DIR="/home/ec2-user/app-logs"

echo "script strated executing at : $TIMESTAMP" &>>$LOG_FILE_NAME

FILES_TO_DELETE=$(find $SOURCE_DIR -name "*.log" -mtime +14)
echo "Files to be deleted: $FILES_TO_DELETE"

while read -r filepath #here filepath is the variale name, we can give any name
do
    echo "Deleting file: $filepath" &>>$LOG_FILE_NAME

    rm -rf $file
    echo "Deleting file: $filepath"

done  <<< $FILES_TO_DELETE