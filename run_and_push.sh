#!/bin/bash

# Exit on errors
set -e

# Ensure argument is provided

cd ../backend

python run_creator.py 2


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
