#!/bin/bash
# bashersize.sh
## a shell script showing bash examples and 
#+ areas for students to apply their knowledge

## VARIABLES
##
## 1. declaring variables in bash
MY_STRING="Here is a variable initialized with a string"
## to print the value of MY_STRING use the below command
# echo $MY_STRING

## other than numbers, strings and arrays, variables can also
#+ utilize something called a command substitution construct
LIST_ALL=`ls -la`
# using command substitution constructs as above, we can
#+ easily assign regular bash commands to a variable
# echo "$LIST_ALL"
# the above will respect whitespace, tabs and newlines
#+ when we echo out LIST_ALL unquoted, space wont preserve
# echo $LIST_ALL

## a newer way to execute a command but not guaranteed for 
#+ all versions of bash is the following syntax
VERSION_INFO=$(uname -m)
# in the above command, notice the $(), this syntax also 
#+ can allow for command substitution constructs like ``

## Just like other languages, you can also declare arrays
#+ to declare an array, create a variable as your typically
#+ would, just ensure to pre-fix with a `declare -a` as below
declare -a MY_ARRAY=(
  "/etc/ssh/ssh_config"
  "/etc/defaults/periodic.conf"
  "/etc/resolv.conf"
)

#### BASHERSIZE ####
## 1. Create a string variable and echo it out
## 2. Create a command construct and echo it out
## 3. Create a number and echo it out

## Logic
##
## 2. Conditional statements
# Please reference the folder readme for a list of conditional switches
# BASIC IF BLOCK CHECKING FOR A LOG FILE

## Basic premise of an if
## if [[ <some test> ]]
#+   then
#+     <commands>
#+ fi
if [[ -f /var/log/messages ]]
  then
    echo "Log file exists"
fi

## Basic premise of an if/else if/else
## if [ <some test> ]
#+   then
#+     <commands>
#+ elif [ <some test> ]
#+   then
#+     <different commands>
#+ else
#+   <other commands>
#+ fi

# remember command line arguments:
# $0 = name of script file running
# $1 = first command line argument
# $2 = second command line argument
if [[ $1 -ge 18 ]]
  then
    echo "You may go to the party."
elif [[ $2 == 'yes' ]]
  then
    echo "You may go to the party but be back before midnight."
else
  echo "You may not go to the party."
fi

# boolean conditionals
if [[ -r $1 ]] && [[ -s $1 ]]
  then
    echo "This file is useful."
fi

# case statements
#+ case <variable> in
#+ <pattern 1>)
#+   <commands>
#+   ;;
#+ <pattern 2>)
#+   <other commands>
#+   ;;
#+ esac

# evaluates the first command line argument
case $1 in
  start)
    echo "starting"
    ;;
  stop)
    echo "stoping"
    ;;
  restart)
    echo "restarting"
    ;;
  *)
    echo "don't know"
    ;;
esac

#### BASHERSIZE ####
## 1. Using a variable, write a conditional state
## 2. Write a conditional statement with an else
## 3. Using the expression list found in the readme, try checking for different conditional expressions
## 4. Create an elseif

## Loops
##
## 3. Conditional statements
## until [CONDITION]
#+  do
#+    [COMMANDS]
#+ done

COUNTER=0

until [ $COUNTER -gt 5 ]
do
  echo "COUNTER: $COUNTER"
  ((COUNTER++))
done

## the loop below will git pull until succesful
#+ until git pull &> /dev/null
#+ do
#+    echo "Waiting for the git host ..."
#+    sleep 1
#+ done
#+ echo -e "\nThe git repository is pulled."

## The above loop iterates as long as the counter variable has a value 
#+ greater than four. The script will produce the following output:
#+ COUNTER 1
#+ COUNTER 2
#+ COUNTER 3
#+ COUNTER 4
#+ COUNTER 5

## FOR LOOPS
#+ for item in [LIST]
#+ do
#+  [COMMANDS]
#+ done

BOOKS=('In Search of Lost Time' 'Don Quixote' 'Ulysses' 'The Great Gatsby')

for book in "${BOOKS[@]}"; do
  echo "Book: $book"
done

## BASH also has a c-style for loop
#+ for ((i = 0 ; i <= 1000 ; i++)); do
#+  echo "Counter: $i"
#+ done

#### BASHERSIZE ####
## 1. Create an array
## 2. Use a for loop to iterate and print out values
## 3. rewrite the for loop to use the c-style for loops

## Tips & Tricks
##
## 3. some ways to make tasks easier with bash

#### BASHERSIZE ####
## 1. TODO: Finish the rest
## 2. Create a command construct and echo it out
## 3. Create a number and echo it out