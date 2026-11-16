#!/bin/bash

SPACE_INDEX="${1:-$YABAI_SPACE_INDEX}"
[ -z "$SPACE_INDEX" ] && exit 0

# Query the active/top managed window on this space (prioritizing the focused window in the stack)
win_info=$(yabai -m query --windows --space "$SPACE_INDEX" 2>/dev/null | jq -r '
  [.[] | select((."is-floating" == false) and (."app" != "Stats") and (."app" != "universalAccessAuthWarn") and (."role" != "AXHelpTag"))] 
  | (map(select(."has-focus" == true))[0] // .[0]) 
  | if . then "\(.id) \(.app)" else empty end
')

if [ -n "$win_info" ]; then
    read -r target_id target_app <<< "$win_info"
    [ -n "$target_id" ] && yabai -m window --focus "$target_id" 2>/dev/null
    if [ -n "$target_app" ]; then
        osascript - "$target_app" 2>/dev/null <<'EOF'
on run argv
    set appName to item 1 of argv
    if application appName is running then
        tell application appName to activate
        tell application "System Events" to set frontmost of process appName to true
    end if
end run
EOF
    fi
fi
