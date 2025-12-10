#!/bin/bash

# this is a bash script to rename files in a directory
i=1
for file in ./texts/*.txt; do
    mv "$file" "./texts/just_a_test-$i.txt"
    i=$((i+1))
done
