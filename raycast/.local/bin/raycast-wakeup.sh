#!/bin/bash

# @raycast.schemaVersion 1
# @raycast.title Wake Up
# @raycast.mode compact
# @raycast.packageName Mac Workflow
# @raycast.description Restore my working applications and Bluetooth

set -e

echo "Restoring your workspace..."

# Enable Bluetooth
if command -v blueutil >/dev/null 2>&1; then
    blueutil --power 1
elif [ -x /opt/homebrew/bin/blueutil ]; then
    /opt/homebrew/bin/blueutil --power 1
elif [ -x /usr/local/bin/blueutil ]; then
    /usr/local/bin/blueutil --power 1
fi

echo "Bluetooth enabled."

# Restore applications
open -a "Brave Browser"
open -a "Time Out"
open -a "Herdr"

echo "Workspace restored."
