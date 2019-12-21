#!/usr/bin/bash

count_blocks () {
    block_count=$(find /home/data/blocks -type f | wc -l)
    str="同期したブロック数→　${block_count}"
    echo $str
}

count_blocks