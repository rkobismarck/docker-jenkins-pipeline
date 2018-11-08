#!/bin/bash

function usage {
    echo "usage: ./instances.sh [action] [config-file]"
    echo "  	 [action] start,stop,state"
    echo "  	 [config] valid route to a config file"
    echo "Something like this :)! -> ./instances.sh start servers.txt"
    exit 1
}

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
    usage
fi

if [ "$2" != "" ] && [ -e "$2" ] ; then
	FILENAME="$2"
	while read -r line; do
		INSTANCEID="$line"
		echo  	"$COMMAND $INSTANCEID Server"
		aws ec2 $COMMAND --instance-ids $INSTANCEID
	done < "$FILENAME"
else
	usage
fi
