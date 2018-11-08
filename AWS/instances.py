#!/usr/bin/python
import sys
import os
import subprocess

PARAMETER_ACTION 		     = 1;
PARAMETER_CONFIG_FILE 	 = 2;
PARAMETER_MINIMUM_ARGS	 = 3;

def usage():
	print "usage: python instances.py [action] [config-file]"
	print "  	 [action] start,stop,state"
	print "  	 [config] valid route to a config file"
	print "Something like this :)! -> python instances.py start servers.txt"
  	exit()
	return 

def doesThisFileExist(fileName):
	return os.path.isfile(fileName)

def validateLengthInputArgs(argument):
	if len(argument) < PARAMETER_ACTION:
		return False
	return True

def assignActionValueForAWS(action):
	if action == "start":
		return "start-instances"
	if action == "stop":
		return "stop-instances"
	if action == "state":
		return "describe-instances"
	usage()

def assemblyAWSCommand(instanceId,command):
	return "aws ec2 "+command+" --instance-ids "+ instanceId

def executeCommand(command):
	return subprocess.check_call((command),shell=True)	

def executeAWSCommand(instanceId,command):
	return executeCommand(assemblyAWSCommand(instanceId,command))

if validateLengthInputArgs(sys.argv) == False:
	usage()

action = assignActionValueForAWS(str(sys.argv[PARAMETER_ACTION]))
config = os.path.dirname(os.path.realpath(__file__))+"/" + str(sys.argv[PARAMETER_CONFIG_FILE])

if doesThisFileExist(config)	==	False:
	usage()

with open(config) as f:
 	arguments_instances = f.readlines()
  	map(lambda (instanceId) : executeAWSCommand(instanceId,action),arguments_instances)






