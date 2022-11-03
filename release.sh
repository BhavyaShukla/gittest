#!/bin/bash

set -eo pipefail

current_branch=$(git rev-parse --abbrev-ref HEAD)
echo "You are on branch $current_branch" 

if [ "$current_branch" != "develop" ] && [ "$current_branch" != "master" ]; then
    echo "WARNING: YOU ARE BRANCH OF OFF "$current_branch", not develop or master."
fi

echo "Enter branch number:"
read NUMBER
echo "Enter branch name:"
read NAME
NEW_BRANCH="BRN-$NUMBER/$NAME"
read -r -p "You are branching of $current_branch to new branch $NEW_BRANCH are you sure you want to proceed [y/n]:" response
case "$response" in
    [yY][eE][sS]|[yY]) 
        echo "Checking out to new $NEW_BRANCH"
        git checkout -b $NEW_BRANCH
        git status
        echo "Branch created"
        exit 0
        ;;
    *)
        echo "Exiting..."
        sleep 2
        exit 0
        ;;
esac