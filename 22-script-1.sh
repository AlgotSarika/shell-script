#!/bin/bash
 
 MSG="SCRIPT1"
 GREET="Hi from SCRIPT-1"
 source 23-script-2.sh

 echo "Hello from:$MSG"

 sh 23-script-2.sh