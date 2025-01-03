#!/bin/bash

USERID=$(id -u)
R="\e[31m"
G="\e[32m"
Y="\e[33m"
LOGS_FOLDER="/var/log/shellscript-logs"
LOG_FILE=$(echo $0 | cut -d "." -f1)
TIMESTAMP=$(date +%y-%m-%d-%H-%M-%S)
LOG_FILE_NAME="$LOGS_FOLDER/$LOG_FILE-$TIMESTAMP.log"

VALIDATE(){
    if [ $? -ne 0 ]
    then
        echo -e "$2 ..$R failure"
        exit 1
    else
        echo -e "$2 ..$G success"
    fi

}

echo "script strated executing at : $TIMESTAMP" &>>$LOG_FILE

if [ $USERID -ne 0 ]
then 
   echo "ERROR:: you must have sudo access to execute this script"
   exit 1 #other then  0
fi

dnf list installed mysql &>>$LOG_FILE

if [ $? -ne 0 ]
then # not installed
    dnf install mysql -y &>>$LOG_FILE
    VALIDATE $? "Installing MYSQL"
else 
    echo -e "mysql is already .. $Y installed"
fi

dnf list installed git &>>$LOG_FILE

if [ $? -ne 0 ]
then #not installed
    dnf install git -y &>>$LOG_FILE
    VALIDATE $? "Installing Git"
else
    echo -e "Git is already .. $Y installed"
fi