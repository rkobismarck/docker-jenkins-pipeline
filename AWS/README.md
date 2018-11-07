## AWS CLI Implementation

The purpose of this script, is to provide you with a centralized control of the instances that you'd have in your AWS EC2 console.

### What will you need?
1. You'll need the script labeled as **instances.sh**
2. You'll need to provide a configuration file like the labeled with **servers.txt**
3. You'll need to configure your terminal, installing the AWS CLI. Please take a look at AWS's Documentation Site.[AWS CLI Installation](https://docs.aws.amazon.com/cli/latest/userguide/installing.html)
4. You'll need to enter the configuration for you recently local CLI instance.[AWS CLI Parameters Configuration](https://docs.aws.amazon.com/es_es/cli/latest/userguide/cli-chap-getting-started.html)

### Assumptions.
At this point you need to have a CLI configured and parametrized it, in your local environment. Yoy should have the **instances.sh** and the **servers.txt** file in your local directory, lets start talking about those two files at first, and after that we'll be able to start controlling our instances based in EC2 at AWS.

### Let's get start with this.
1. Open the file **instances.sh**, please you'll see that we're reading two parameters

> $1 -> Action that we're going to perform.

Parameter 		| Description
------------ 	| -------------
start | This parameter is intended to start the instances.
stop | This parameter is intended to stop the instances.
state | This parameter is intended to recover information from our instances. 

You can continue adding **actions** as you wish, this is going to help you about centralizing your tasks of instance manipulation.

> $2 -> Configuration file, here resides the instancesIds of our AWS instances.

At this point, you have to provide a configuration file, which contains the list of instances_ids, that we'll be targeting. The file itself contains instancesIds separated by a break line.
![alt text](https://github.com/rkobismarck/docker-jenkins-pipeline/blob/master/media-content/aws-configuration-1.png "AWS Server Configuration")
Note: You can name your configuration file as you wish, and even you can have several configuration files, this provides you with a powerful tool for handling complex environments.

And because of that, we're going to have a execution line like the next one:
```console
MacBook-Pro-de-Roberto:AWS robertotrujillo$ ./instances.sh state servers.txt
```

The result, we're going to perform in base of the selected action, the same action for all the instancesId that are present in the servers.txt configuration file that you provide in the execution argument.
