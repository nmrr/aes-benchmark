#!/bin/bash

echo "AES-128-CBC"

for i in `seq 1 10`;do { time -p openssl enc -aes-128-cbc -in /tmp/aes/512m-plain -pbkdf2 -salt -k HELLO -out /tmp/aes/512m-enc ; };done 2>/tmp/aes/aes-128-bench.txt
cat /tmp/aes/aes-128-bench.txt | grep "real" | cut -d ' ' -f 2 | tr ',' '.' | awk '{ SUM += $1} END { print SUM/10 "s" ; print 512/(SUM/10) " Mbps"; }'

echo ""
echo "AES-192-CBC"

for i in `seq 1 10`;do { time -p openssl enc -aes-192-cbc -in /tmp/aes/512m-plain -pbkdf2 -salt -k HELLO -out /tmp/aes/512m-enc ; };done 2>/tmp/aes/aes-192-bench.txt
cat /tmp/aes/aes-192-bench.txt | grep "real" | cut -d ' ' -f 2 | tr ',' '.' | awk '{ SUM += $1} END { print SUM/10 "s" ; print 512/(SUM/10) " Mbps"; }'

echo ""
echo "AES-256-CBC"

for i in `seq 1 10`;do { time -p openssl enc -aes-256-cbc -in /tmp/aes/512m-plain -pbkdf2 -salt -k HELLO -out /tmp/aes/512m-enc ; };done 2>/tmp/aes/aes-256-bench.txt
cat /tmp/aes/aes-256-bench.txt | grep "real" | cut -d ' ' -f 2 | tr ',' '.' | awk '{ SUM += $1} END { print SUM/10 "s" ; print 512/(SUM/10) " Mbps"; }'

exit 0
