#!/bin/bash

# Exit on errors
set -e

cd ../backend

# Only run creator if an argument is provided
if [ -n "$1" ]; then
  python run_creator.py "$1"
else
  echo "No argument provided, skipping run_creator.py"
fi

cd ../frontend

echo "Pulling latest changes from origin..."
git pull origin main

echo "Adding changes to git..."
git add .

echo "Committing..."
git commit -m "Auto update"

echo "Pushing..."
git push

echo "Done!"
