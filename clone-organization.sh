#!/bin/bash

SCRIPT_DIR=$(dirname "$0")

cd "$SCRIPT_DIR/.."

ORG="haui-food"

PAGE=1
PER_PAGE=100

while :; do
  response=$(curl -s "https://api.github.com/orgs/$ORG/repos?per_page=$PER_PAGE&page=$PAGE")

  if [ "$(echo "$response" | wc -c)" -le 2 ]; then
    break
  fi

  echo "$response" | grep -o '"clone_url": *"[^"]*"|"name": *"[^"]*"' | sed -n 'N;s/\n/ /;s/"name": *"\([^"]*\)".*"clone_url": *"\([^"]*\)"/\1 \2/p' | while read -r repo_name repo_url; do
    if [ "$repo_name" = "haui-food-setup" ]; then
      echo "Skipping repository $repo_name"
      continue
    fi
    if [ -d "$repo_name" ]; then
      echo "Repository $repo_name already exists, skipping..."
    else
      git clone "$repo_url"
    fi
  done

  PAGE=$((PAGE + 1))
done
