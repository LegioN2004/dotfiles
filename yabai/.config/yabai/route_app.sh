#!/bin/bash

export PATH="/opt/homebrew/bin:/usr/local/bin:$PATH"

# Route any misplaced standard window of a matching app back to its designated space.
# Usage: route_app.sh <app_regex> <target_space> [--focus]
app_regex="$1"
target_space="$2"
follow_focus="$3"

[ -z "$app_regex" ] || [ -z "$target_space" ] && exit 1

misplaced=$(yabai -m query --windows 2>/dev/null | jq -r --arg re "$app_regex" --argjson sp "$target_space" '
  .[] | select((.app | test($re)) and (.subrole == "AXStandardWindow") and (."is-sticky" == false) and (.space != $sp)) | .id
')

for wid in $misplaced; do
    yabai -m window "$wid" --space "$target_space" 2>/dev/null
done

if [ "$follow_focus" = "--focus" ]; then
    curr_space=$(yabai -m query --spaces --space 2>/dev/null | jq -r '.index')
    if [ "$curr_space" != "$target_space" ]; then
        yabai -m space --focus "$target_space" 2>/dev/null
    fi
fi
