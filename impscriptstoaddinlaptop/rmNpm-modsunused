#!/bin/bash
file='unused-deps.txt'
echo "list all unused deps"
npx depcheck > $file
n=1
while read line; do
dep=$( echo "$line" | cut -c 3- )
echo "uninstall : $dep"
npm uninstall "$dep"
n=$((n+1))
done < $file
