#!/bin/bash
source="./texts"
destination="./backup"
today=$(date +"%Y-%m-%d")

mkdir -p "$destination/$today"
cp -r "$source" "$destination/$today"
echo "Backup complete"
