#!/usr/bin/bash

DIR=/home/data/blocks
RECEIVER=peer_node_1
USER=root

echo "creating blocks directory"
sshpass -p "password" ssh -o "StrictHostKeyChecking no" $USER@$RECEIVER mkdir $DIR
echo "transfer block data"
sshpass -p "password" scp -o "StrictHostKeyChecking no" /home/data/blocks/block000.txt peer_node_1:/home/data/blocks/