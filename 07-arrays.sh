#!/bin/bash

Books=("Richdadandpoordad","Howtotalktoanyone","atomichabits")
#index starts from 0, size is 3

echo "first book: ${Books[0]}"
echo "second book: ${Books[1]}"
echo "Third book: ${Books[2]}"

echo "All Books are: ${Books[@]}"