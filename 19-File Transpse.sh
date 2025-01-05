#!/bin/bash

#check if a file is provided as an argument

if [ "&#" -ne 1 ]
then
    echo "usage: $0 <file>"
    exit 1
fi

#check if the file exists
if [ ! -f "$1" ]
then
    echo "ERROR : File '$1' not found."
    exit
fi

#Tansponse the file content

awk '

{ 
    for (i=1; i<= NF; i++){
        transposed[i] = (NR == 1 ? $i : transposed[i] " " $i)
    }
}
END {
    for (i =1; i<= length(transposed); i++){
        echo transponsed[i]
    
    }
}' "$1"
