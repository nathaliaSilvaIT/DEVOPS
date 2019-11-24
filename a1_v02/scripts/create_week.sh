#!/bin/bash
# create_week.sh
# generates a new exercise week in this project
# this script must be run from either root dir or scripts

# find out what week to generate
WEEK=0
DIR=$(basename "`pwd`" )

# ensure user is in root project or scripts folder before continuing
case $DIR in
  course-material)
    cd scripts
    ;;
  scripts)
    ;;
  *)
    echo "Please ensure you are either in the root directory or in scripts."
    exit 1
esac

until [[ $WEEK -ge 3 && $WEEK -le 15 ]]
  do
    echo "What week would you like to generate? [3-10] : "
    read WEEK
done

BASE_PATH="../exercises/week-${WEEK}"

# create exercise folder
mkdir -p "${BASE_PATH}"
mkdir -p "${BASE_PATH}/challenges"
mkdir -p "${BASE_PATH}/solutions"

# create challenge markdown
touch "${BASE_PATH}/challenges/level1.md"
touch "${BASE_PATH}/challenges/level2.md"
touch "${BASE_PATH}/challenges/level3.md"
