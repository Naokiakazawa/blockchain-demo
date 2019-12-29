#!/usr/bin/bash

DIR=/home/data/blocks/
RECEIVER=$1
USER=root
BLOCKNUM=0

transfer_block(){
	N="000${BLOCKNUM}"
	sshpass -p "password" rsync -au $DIR/block${N: -3}.json $USER@$RECEIVER:$DIR 2>/dev/null
	echo -e "Transfer #${N: -3} block !\n"
	$((BLOCKNUM++)) 2>/dev/null
}

sshpass -p "password" ssh -o "StrictHostKeyChecking no" $USER@$RECEIVER mkdir -p $DIR

while true
do
	transfer_block
	sleep $2s
done