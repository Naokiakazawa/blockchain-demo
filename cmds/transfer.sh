#!/usr/bin/bash

DIR=/home/data/blocks
RECEIVER=peer_node_1
USER=root

sshpass -p "password" ssh -o "StrictHostKeyChecking no" $USER@$RECEIVER mkdir -p $DIR

while true
do
	sshpass -p "password" rsync -au $DIR/ $USER@$RECEIVER:$DIR/ 2>/dev/null
    sleep 0.5s
done