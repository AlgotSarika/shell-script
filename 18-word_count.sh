#!/bin/bash

if [ "$#" -ne 1 ]
then
    echo "usage: $0 <file>"
    exit 1
fi

if [ ! -f "$1" ]
then
    echo "ERROR:File '$1' not found"
    exit 1
fi

#process the file and count word occurrences
echo "Top 5 most frequent words:"
tr -c '[:alnum:]' '[\n*]' < "$1" | tr '[:upper:]' '[:lower:]' | grep -v '^$' | sort | uniq -c | sort -nr | head -n 5 