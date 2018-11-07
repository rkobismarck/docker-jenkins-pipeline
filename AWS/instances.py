#!/usr/bin/python
import sys
import os.path



def doesThisFileExist(fileName):

	return os.path.isfile(os.path.dirname(os.path.realpath(__file__))+"/"+fileName)


PARAMETER_ACTION 		= 1;
PARAMETER_CONFIG_FILE 	= 2;

if len(sys.argv)<3:
	print "Non valid argument was supplied, please try again."
	exit()

action = str(sys.argv[PARAMETER_ACTION])
config = str(sys.argv[PARAMETER_CONFIG_FILE])

print 'ACTION',action ;
print 'CONFIG',config ;

print "Hello World!"
print doesThisFileExist("servito.txt")
