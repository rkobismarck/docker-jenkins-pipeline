#!/bin/bash
if [ "$1" != "" ]; then
    if [ "$1" == "start" ]; then
    	COMMAND="start-instances"
	fi

    if [ "$1" == "stop" ]; then
    	COMMAND="stop-instances"
	fi

	if [ "$1" == "state" ]; then
    	COMMAND="describe-instances"
	fi


else
    echo "Non valid argument was supplied, please try again with: start, stop."
    exit
fi

if [ "$2" != "" ] && [ -e "$2" ] ; then
	FILENAME="$2"
	while read -r line; do
		INSTANCEID="$line"
		echo  	"$COMMAND $INSTANCEID Server"
		aws ec2 $COMMAND --instance-ids $INSTANCEID
	done < "$FILENAME"
else
	echo "Non valid server configuration file was supplied, please valid that you select a valid configuration file for the process.."
fi
