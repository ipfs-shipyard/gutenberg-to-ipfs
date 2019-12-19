#!/usr/bin/env bash

set -e


folder=ipfs-archive
added=added.txt
# for b in $folder/*; do
#     echo -n "$b" | grep '\r'
# done
# exit

for b in $folder/*; do
    name=`basename "$b"`
    if grep -q "$name" "$added"; then
        echo "Skipping (already added): $name"
        continue
    fi
    echo -n "Adding $b..."
    cid=`ipfs-cluster-ctl $@ add -Q --raw-leaves --cid-version 1 -r --name "$name" --local "$b"`
    echo "$cid"
    echo "$name" "$cid" >> "$added"
done
