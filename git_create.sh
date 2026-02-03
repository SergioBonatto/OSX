#!/usr/bin/env bash

set -e

if [ -z "$1" ]; then
  echo "Uso: git-init-push <url-do-repositorio>"
  exit 1
fi

REPO_URL="$1"

git init
git add .
git commit -m "first commit"
git branch -M master
git remote add origin "$REPO_URL"
git push -u origin master

