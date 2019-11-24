#!/bin/bash
# Comment something for something
echo Enter your week number 
echo Note : Week can only be between 1-10 and contain no prefixed 0\'s
read weekNumber
while [ $weekNumber -gt 10 ] && [ $weekNumber -lt 1 ]
do
	echo Hey this number is greater than 10
        read weekNumber
done

title="week-$weekNumber"
week_title(){
	mkdir "C:\Users\Admin\Desktop\DevOp\course-material\students\101142560\ ${title}"
	cp -r $MY_COURSE "C:\Users\Admin\Desktop\DevOp\course-material\students\101142560\ ${title}"
	
}



week_title
