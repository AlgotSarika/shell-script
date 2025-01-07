#!/bin/bash

DISK_USAGE=$(df -hT | grep xfs)
DISK_THRESHOLD=5 #real projects will monitor for 70

while read -r line
do
    USAGE=$(echo $line | awk -F " " '{print $6F}' |cut -d "%" -f1)
    PARTITION=$(echo $line | awk -F " " '{print $NF}')
    #echo "partition:$PARTITION, usage: $USAGE"
    if [ $USAGE -ge $DISK_THRESHOLD ]
    then
        MSG+="High Disk usage in partition: $PARTITION usage is: $USAGE"
done <<< $DISK_USAGE

echo  "Message:$MSG"