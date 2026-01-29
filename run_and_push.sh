#!/bin/bash

# Exit on errors
set -e

# Ensure argument is provided

echo "Pulling latest changes from origin..."
git pull origin main


echo "Adding changes to git..."
git add .

echo "Committing..."
git commit -m "Auto update"

echo "Pushing..."
git push

echo "Done!"
