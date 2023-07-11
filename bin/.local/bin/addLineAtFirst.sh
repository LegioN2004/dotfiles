#!/bin/bash
# this script adds lines at first of every file in a directory with specific filetype
for f in *.java; do
  printf '%s\n' 0a 'package FirstJava;' . x | ex "$f"
done
