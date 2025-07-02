#!/usr/bin/python3

import sys
from pwn import *

context(os="linux",arch="amd64",log_level="error")

file = ELF(sys.argv[1])
shellcode = file.section(".text")
print(shellcode.hex())

#python extract.py test
#Without the hex encoding
#b'\xb8\x01\x00\x00\x00\xbf\x01\x00\x00\x00H\xbe\x00 @\x00\x00\x00\x00\x00\xba\t\x00\x00\x00\x0f\x05\xb8<\x00\x00\x00\xbf\x00\x00\x00\x00\x0f\x05'

#b801000000bf0100000048be0020400000000000ba090000000f05b83c000000bf000000000f05