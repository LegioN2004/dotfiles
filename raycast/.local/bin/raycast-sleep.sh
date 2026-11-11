#!/bin/bash

# @raycast.schemaVersion 1
# @raycast.title Sleep Workspace
# @raycast.mode compact
# @raycast.packageName Mac Workflow
# @raycast.description Quit all apps except Finder and Ghostty, disable Bluetooth and sleep

set -e

echo "Preparing Mac for sleep..."

# Gracefully quit all running GUI applications except Finder, Ghostty, and Raycast.
osascript <<'APPLESCRIPT'
set excludedNames to {"Finder", "ghostty", "Ghostty", "Raycast", "Terminal", "iTerm2", "alacritty", "kitty"}
set excludedBundles to {"com.apple.finder", "com.mitchellh.ghostty", "com.raycast.macos", "com.apple.Terminal", "com.googlecode.iterm2"}

-- Step 1: Gather list of apps to quit upfront (avoids invalid IPC connection errors when apps terminate)
set appsToQuit to {}
tell application "System Events"
    set procList to every application process whose background only is false
    repeat with p in procList
        set pName to ""
        set bId to ""
        try
            set pName to name of p
        end try
        try
            set bId to bundle identifier of p
        end try
        
        if (pName is not in excludedNames) and (bId is not in excludedBundles) then
            set end of appsToQuit to {appName:pName, bundleId:bId}
        end if
    end repeat
end tell

-- Step 2: Request each target app to quit
repeat with appInfo in appsToQuit
    set bId to bundleId of appInfo
    set aName to appName of appInfo
    if bId is not "" then
        try
            tell application id bId to quit
        end try
    else if aName is not "" then
        try
            tell application aName to quit
        end try
    end if
end repeat

-- Step 3: Wait up to 5 seconds for apps to exit cleanly without raising errors
repeat with attempt from 1 to 10
    set stillRunning to false
    tell application "System Events"
        set currentProcs to every application process whose background only is false
        repeat with p in currentProcs
            set pName to ""
            try
                set pName to name of p
            end try
            if (pName is not "") and (pName is not in excludedNames) then
                set stillRunning to true
                exit repeat
            end if
        end repeat
    end tell
    if not stillRunning then
        exit repeat
    end if
    delay 0.5
end repeat
APPLESCRIPT

echo "Applications closed."

# Disable Bluetooth
if command -v blueutil >/dev/null 2>&1; then
    blueutil --power 0
elif [ -x /opt/homebrew/bin/blueutil ]; then
    /opt/homebrew/bin/blueutil --power 0
elif [ -x /usr/local/bin/blueutil ]; then
    /usr/local/bin/blueutil --power 0
fi

echo "Bluetooth disabled."

# Brief pause before sleep
sleep 1

echo "Putting Mac to sleep..."
/usr/bin/pmset sleepnow
