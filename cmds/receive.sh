#!/usr/bin/bash

count_blocks () {
    block_count=$(find /home/data/blocks -type f | wc -l)
    str="同期したブロック数→　${block_count}"
    echo $str
    sleep 1s
}

while true
do
    count_blocks
done