#!/bin/bash

SCRIPT_DIR=$(dirname "$0")

cd "$SCRIPT_DIR/.."

ORG="haui-food"
PAGE=1

while : ; do
    RESPONSE=$(curl -s "https://api.github.com/orgs/$ORG/repos?per_page=100&page=$PAGE")
    
    if [[ -z "$RESPONSE" || "$RESPONSE" == "[]" ]]; then
        break
    fi
    
    REPOS=$(echo "$RESPONSE" | grep -o '"clone_url": "[^"]*' | cut -d'"' -f4)
    
    for REPO in $REPOS; do
        echo "Cloning $REPO..."
        git clone $REPO
    done

    PAGE=$((PAGE + 1))
done
