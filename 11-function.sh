#!/bin/bash

USERID=$(id -u)

VALIDATE(){
    if [ $? -ne 0 ]
    then
        echo "$2 ..failure"
        exit 1
    else
        echo "$2 .. success"
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
    echo "mysql is already .. installed"
fi

dnf list installed git

if [ $? -ne 0 ]
then #not installed
    dnf install git -y
    VALIDATE $? "Installing Git"
else
    echo "Git is already .. installed"
fi