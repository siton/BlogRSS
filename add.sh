#!/bin/sh

IFS="
"

for FILE in `ls ./*.opml`; do
  grep "<outline html" $FILE | awk -F "title" '!a[$1]++' | awk -F \" '{print "\["$4"\]\("$2"\) : "$6"\n\n"}' | tee README.md

done
