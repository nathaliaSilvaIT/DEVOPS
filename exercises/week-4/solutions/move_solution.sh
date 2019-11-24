#!/bin/bash
#move_solution.sh
source ../../../../../.bashrc
WK=1

until [[ $WK -ge 3 && $WK -le 10 ]]
  do
    echo "Enter week number to generate folder [3-10]: "
    read WK
done

ROUTE="week-${WK}"
FULL_ROUTE="${COURSE_MATERIAL}/students/101149416/${ROUTE}"

cp -rf "../../${ROUTE}" $FULL_ROUTE

exit 0
