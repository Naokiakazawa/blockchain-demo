#!/usr/bin/bash

DIR=/home/data/blocks
RECEIVER=$1
USER=root

sshpass -p "password" ssh -o "StrictHostKeyChecking no" $USER@$RECEIVER mkdir -p $DIR

while true
do
	sshpass -p "password" rsync -auv $DIR/ $USER@$RECEIVER:$DIR/ 2>/dev/null
    sleep $2s
done