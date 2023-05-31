#!/bin/bash

is_inside_work_tree=$(git rev-parse --is-inside-work-tree)

if [ "$is_inside_work_tree" = "true" ]; then
  # If inside a git repo
  cd "$(git rev-parse --show-toplevel)"
  # delete the index.lock file that makes the repo busy
  rm -rf .git/index.lock
else
  # print if not in a git repo
  echo "Not in a git repository"
fi
