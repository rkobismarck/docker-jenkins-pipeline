#!/bin/bash
if [ "$1" != "" ]; then
    if [ "$1" == "start" ]; then
    	COMMAND="start-instances"
	fi

    if [ "$1" == "stop" ]; then
    	COMMAND="stop-instances"
	fi	

	echo  "$COMMAND Jenkins Server"
	aws ec2 $COMMAND --instance-ids i-042d48d762598044a
	
	echo "$COMMAND Docker Server"
	aws ec2 $COMMAND --instance-ids i-0d2e4dce957337587
	
else
    echo "No valid argument was supplied, please try again with: start, stop."
    exit
fi

