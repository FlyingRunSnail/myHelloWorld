#!/bin/bash

dd if=$1 of=Image bs=64 skip=1
aarch64-linux-gnu-objcopy --change-addresses=0x80080000 -I binary -O elf64-littleaarch64 -B aarch64 Image out
aarch64-linux-gnu-objdump -D out > dump.dis
