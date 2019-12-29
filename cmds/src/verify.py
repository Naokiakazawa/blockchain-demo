#!/usr/bin/python3.6

import json

class Verify():
    def __init__(self):
        self.prev_block = open("/home/data/blocks/block000.txt", "r")
        self.now_block = open("/home/data/blocks/block001.txt", "r")

    def check_hashchain(self):
        prev_block = json.loads(self.prev_block)
        prev_hash = prev_block["block_hash"]

        now_block = json.loads(self.now_block)
        block_hash = now_block["prev_hash"]

        return prev_hash == block_hash

    def check_proof_of_work(self):
        now_block = json.loads(self.now_block)
        bits = now_block["bits"]
        block_hash = now_block["block_hash"]

        bits = int(bits, 16)
        exponent_bytes = (bits >> 24) - 3
        exponent_bits = exponent_bytes * 8
        coefficient = bits & 0xffffff
        target = coefficient << exponent_bits

        return int(block_hash, 16) <= target

if __name__ == "__main__":
    verify = Verify()
    flag_hashchain = verify.check_hashchain()
    flag_pow = verify.check_proof_of_work()
    if flag_hashchain and flag_pow :
        print("valid block")
    else:
        print("Invalid block")