#!/usr/bin/python3.6

import hashlib
import json

DATA_DIR = "/home/data/blocks/"

block_height = 0
block_file = DATA_DIR + "block" + str(block_height).rjust(3, "0") +".json"
with open(block_file, 'r') as json_data:
    block_data = json.load(json_data)
    print(block_data)