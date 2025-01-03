#!/bin/bash

USERID=$(id -u)
R="\e[31m"
G="\e[32m"
Y="\e[33m"

VALIDATE(){
    if [ $? -ne 0 ]
    then
        echo -e "$2 ..$R failure"
        exit 1
    else
        echo -e "$2 ..$G success"
    fi

}

if [ $USERID -ne 0 ]
then 
   echo "ERROR:: you must have sudo access to execute this script"
   exit 1 #other then  0
fi

dnf list installed mysql

if [ $? -ne 0 ]
then # not installed
    dnf install mysql -y
    VALIDATE $? "Installing MYSQL"
else 
    echo -e "mysql is already .. $Y installed"
fi

dnf list installed git

if [ $? -ne 0 ]
then #not installed
    dnf install git -y
    VALIDATE $? "Installing Git"
else
    echo -e "Git is already .. $Y installed"
fi