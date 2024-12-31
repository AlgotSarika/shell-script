#!/bin/bash

Number=$1

# -gt, -lt. -eq, -ge, -le

if [ $Number -gt 200 ]
then
    echo "given number is greater than 200"
else
    echo "given number is less than or equal to 200"

fi
