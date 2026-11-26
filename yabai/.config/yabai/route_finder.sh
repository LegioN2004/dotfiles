#!/bin/bash

# Route any misplaced Finder window back to Space 4 and switch focus there.
exec "$(dirname "$0")/route_app.sh" "^Finder$" 4 --focus
