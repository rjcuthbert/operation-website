#!/bin/bash

# Exit on errors
set -e

# Ensure argument is provided
if [ -z "$1" ]; then
  echo "Error: No argument provided."
  echo "Usage: ./run_and_push.sh <page_name>"
  exit 1
fi

ARG1="$1"
ARG2="$1"

echo "Running create_pages.py with argument: $ARG"
python3 create_pages.py $ARG1 "$ARG2"

echo "Adding changes to git..."
git add .

echo "Committing..."
git commit -m "Auto update: ran create_pages.py with argument '$ARG'"

echo "Pushing..."
git push

echo "Done!"
