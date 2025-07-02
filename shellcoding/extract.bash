#!/bin/bash
for i in $(objdump -d $1 |grep "^ " |cut -f2); do echo -n $i; done; echo;


# ./extract.bash test 
# b801000000bf0100000048be0020400000000000ba090000000f05b83c000000bf000000000f05