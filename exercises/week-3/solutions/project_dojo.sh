#!/bin/bash

# captrue dir name from user
echo "Please enter the project name:"
read PROJ_NAME

# enter directory, create base source, curl gitingore
mkdir "${PROJ_NAME}"
cd "${PROJ_NAME}"
mkdir -p scripts exercises
touch scripts/create_week.sh README.md
echo "# Dojo Exercises" >> README.md
curl https://raw.githubusercontent.com/github/gitignore/master/Node.gitignore -o .gitignore

# scaffold first exercise week
START_WEEK=exercises/week-3
mkdir -p $START_WEEK
mkdir -p "${START_WEEK}/challenges" "${START_WEEK}/solutions"

# NPM stuff
npm init -y

# git stuff
git init
git add .
git commit -m 'initial commit'
git branch week-03
git checkout week-03

exit 0
