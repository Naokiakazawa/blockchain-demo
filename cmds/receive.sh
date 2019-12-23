#!/usr/bin/bash

count_blocks () {
    block_count=$(ls -U1 /home/data/blocks | wc -l)
    str="同期したブロック数→　${block_count}"
    echo $str
    sleep 1s
}

while true
do
    count_blocks
done