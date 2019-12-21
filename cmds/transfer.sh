#!/usr/bin/bash

DIR=/home/data/blocks
RECEIVER=peer_node_1
USER=root
BLOCK_COUNT=0

transfer_block () {
	echo "==> transfer #$1 block!!"
	sshpass -p "password" scp -o "StrictHostKeyChecking no" $DIR/block$1.txt peer_node_1:$DIR/
}

sshpass -p "password" ssh -o "StrictHostKeyChecking no" $USER@$RECEIVER mkdir -p $DIR

while true
do
	NUM=$(printf "%03d\n" "${BLOCK_COUNT}")
	transfer_block $NUM
	BLOCK_COUNT=$((++BLOCK_COUNT))
done
