#!/bin/bash

# Move any non-Space-4 Finder standard window strictly back to Space 4
misplaced=$(yabai -m query --windows 2>/dev/null | jq -r '
  .[] | select((.app == "Finder") and (.subrole == "AXStandardWindow") and (.space != 4)) | .id
')

for wid in $misplaced; do
    yabai -m window "$wid" --space 4 2>/dev/null
done

# Focus Space 4 if Finder is activated while on another space
curr_space=$(yabai -m query --spaces --space 2>/dev/null | jq -r '.index')
if [ "$curr_space" != "4" ]; then
    yabai -m space --focus 4 2>/dev/null
fi
