#!/bin/bash

# Exit on errors
set -e

# Ensure argument is provided
if [ -z "$1" ]; then
  echo "Error: No argument provided."
  echo "Usage: ./run_and_push.sh <page_name>"
  exit 1
fi




echo "Pulling latest changes from origin..."
git pull origin main


echo "Adding changes to git..."
git add .

echo "Committing..."
git commit -m "Auto update"

echo "Pushing..."
git push

echo "Done!"
