## Docker-Jenkins Workflow
 
 The purpose of this guide, is to show you just a way to construct a continuos integration strategy trough Docker-Jenkins related technologies. In this repository you'll be able to find source code, that you will need, this is just such like a template so feel free to use this one is what you're just looking for a fast solution to test, some kind of prototype or proof of concept. This guide is based on several sources of information, you'll find the links at the end of the article.

### What will you need?
1. GitHub/BitBucket account or any other related provider.
2. Source code to deploy.
3. Docker registry account or any other related provider(public/private).
4. AWS EC2 (Or any other platfform that supports cloud computing).
5. PuTTy sw installed on your local computer.[Get it here](https://www.putty.org/)

### Assumptions.
There are three basic things that you need to know about a integration process between Jenkins and Docker, first of all i'm going to suposse that you know what's Docker and how does it works but if you don't just dont worry and go to the [Docker Site](https://docs.docker.com/get-started/#conclusion-of-part-one) and take yourself into a journey of UNIX and containers. But let's go to the point you need to consider the **Dockerfile** as like a recipe for the container construction.

The Dockerfile is intended to be used when you're building a docker image, and you'll need a **Jenkinsfile** to construct a pipeline. A pipeline is a programatic way of defining a set of tasks that are going to be executed by the Jenkins plattform when it's performed a build task.


### Let's get start with this.
1. First of all you have two choices, [clone](https://github.com/rkobismarck/hobbyApp.git) this repository with the source code and avoid writting your own Dockerfile,Jenkinsfile and SourceCode by having this approach you'll be focusing only on the related infrastructure setup involving Jenkins-Docker-AWS or just start from the begining creating your own repo and of course adding your desired source code, Dockerfile and Jenkinsfile that's your choice.
2. Create an account [here](https://hub.docker.com/) in the Docker registry and take note about the credentials, we'll need'em in foreward steps. 
3. Create a free account on AWS just register yourself [here](https://aws.amazon.com/free/).
4. Sign in AWS and go to: Console => _Build a solution_ and look for the option _Launch a virtual machine with **EC2**_.[AWS EC2 Overview](https://aws.amazon.com/ec2/)
![alt text](https://github.com/rkobismarck/docker-jenkins-pipeline/blob/master/media-content/aws-1.png "Logo Title Text 1")
5. In this step you're going to select your prefered SO for your own VM, i'd recommed to choose a simple and lightweigth one and take advice of the free tier selection, this are not going to charge you for the service despite another heavier machines that are going to lead AWS charging for the services.
6. Select free tier checkbox: 
![alt text](https://github.com/rkobismarck/docker-jenkins-pipeline/blob/master/media-content/aws-2.png "Logo Title Text 1")
7. Select Ubuntu Server 16.04 LTS
![alt text](https://github.com/rkobismarck/docker-jenkins-pipeline/blob/master/media-content/aws-3.png "Logo Title Text 1") 
8. Select **free tier option** to avoid any charge for the next 12 months => Review and Launch
![alt text](https://github.com/rkobismarck/docker-jenkins-pipeline/blob/master/media-content/aws-4.png "Logo Title Text 1")
9. You must create a new key pair, so you have to select the option **create a new key pair** and of course give a name for the file that you're going to create and download. **NOTE** It's very important for you to save this file in a safety place, because it's impossible to get it again and if lose the file you'll be unable to connect to the VM and won't be avoidable your VM will be doomed and unable to access by yourself at anyway. Just push **download** save the file and after that push **launch instances**.
![alt text](https://github.com/rkobismarck/docker-jenkins-pipeline/blob/master/media-content/aws-6.png "Logo Title Text 1")
10. Save your key on your local directory.
![alt text](https://github.com/rkobismarck/docker-jenkins-pipeline/blob/master/media-content/aws-7.png "Logo Title Text 1")
11. Push **launch instances** and you're going to be redirected to the next page, this is gonna put you on advise about your new VM, and how to connect to you VM avoid this we're going to see this in foreward steps.
![alt text](https://github.com/rkobismarck/docker-jenkins-pipeline/blob/master/media-content/aws-8.png "Logo Title Text 1")
![alt text](https://github.com/rkobismarck/docker-jenkins-pipeline/blob/master/media-content/aws-9.png "AWS Instances")
12. Let's transform your aws.pem into a aws.ppk
  * Open PuTTYgen app.
  ![alt text](https://github.com/rkobismarck/docker-jenkins-pipeline/blob/master/media-content/aws-10.png "PuTTYgen")
  * Double check that you have selected RSA in parameters section, and press load a windows will pop up, go to the directory where your pem file is located, select this and push open.
  * Accept the confirmation pop up.
  * Save the private key file on you local directory and give a meaningful name to the file.
  * Leave empty the passphrase box, and confirm that is your desire to leave it empty when prompted.
13. We are going to configure a software that allow us to connect via SSH to our AWS Instance, in my case and due to the lack of a Windows computer rigth now, i¡m going to configure a Termius session on a Mac.
14. Open up Termius sofware and configure your SSH session.
15. Click on the down arrow and select option => Keychain.
 ![alt text](https://github.com/rkobismarck/docker-jenkins-pipeline/blob/master/media-content/aws-11.1.png "Termius")
16. Select addkey option.
 ![alt text](https://github.com/rkobismarck/docker-jenkins-pipeline/blob/master/media-content/aws-12.png "Termius")
17. Add a label, and open up your ppk file with a text editor and copy the entire content into the _PrivateKey_ textbox, press save button.
 ![alt text](https://github.com/rkobismarck/docker-jenkins-pipeline/blob/master/media-content/aws-13.png "Termius")
18. After adding your key we're going to add our host configuration. Go to _Hosts_ and select _New Host_
 ![alt text](https://github.com/rkobismarck/docker-jenkins-pipeline/blob/master/media-content/aws-14.png "Termius")
19. Go to your AWS console and get the public ip of your AWS Instance.
![alt text](https://github.com/rkobismarck/docker-jenkins-pipeline/blob/master/media-content/aws-15.png "AWS Console")
20. Fill out the new host data required.
![alt text](https://github.com/rkobismarck/docker-jenkins-pipeline/blob/master/media-content/aws-16.png "AWS Console")
21. In the key section click on the arrow and select the recent created key configuration _AWSEC2_
![alt text](https://github.com/rkobismarck/docker-jenkins-pipeline/blob/master/media-content/aws-17.png "Termius")
![alt text](https://github.com/rkobismarck/docker-jenkins-pipeline/blob/master/media-content/aws-18.png "Termius")
22. Click connect and we're up and running on your AWSEC2 instance.
![alt text](https://github.com/rkobismarck/docker-jenkins-pipeline/blob/master/media-content/aws-19.png "Termius")
Let's install Docker in our Ubuntu AWSEC2 instance.
23. The simplest way to get installed DockerCE on your system:
```console
ubuntu@ip-172-31-36-168:~$ curl -sSL https://get.docker.com/ | sh
```
24. After installing Docker let's create a Unix group docker and add your current user.
```console
ubuntu@ip-172-31-36-168:~$ groupadd docker
```
25. Add your user to the docker group.
```console
sudo usermod -aG docker $USER
```
26. Reboot your instance and after the restart connect it again. 
![alt text](https://github.com/rkobismarck/docker-jenkins-pipeline/blob/master/media-content/aws-20.png "AWS Reboot")
27. Just after the reboot, double check the procedure with the next command you must have an output simmilar to this one, otherwise retry step 25.
```console
ubuntu@ip-172-31-36-168:~$ docker ps
CONTAINER ID        IMAGE               
COMMAND             CREATED             
STATUS              PORTS               
NAMES
ubuntu@ip-172-31-36-168:~$ 
```
28. We're going to run a Jenkin's instance using docker, with the next command:
```console
ubuntu@ip-172-31-36-168:~$ docker container run -d -p 8080:8080 jenkins
Unable to find image 'jenkins:latest' locally
latest: Pulling from library/jenkins
3e731ddb7fc9: Pull complete 
47cafa6a79d0: Pull complete 
79fcf5a213c7: Pull complete 
68e99216b7ad: Pull complete 
0e688b2d7215: Pull complete 
b3e9ec3ed749: Pull complete 
dcd3ba267864: Pull complete 
5672be24157f: Pull complete 
8c5307d6ff27: Pull complete 
d30b5c69f2b9: Pull complete 
da261a9c5016: Pull complete 
50ef9f1d2201: Pull complete 
997a5a8696f1: Pull complete 
1605539b4940: Pull complete 
a78e3b0e6f48: Pull complete 
eba55850699d: Pull complete 
49ac780bca8b: Pull complete 
f7d0cbfa302c: Pull complete 
dc2c874404c1: Pull complete 
51776d145070: Pull complete 
Digest: sha256:611fd69478bd2c284479669cbaaeabd45c5d866c1d14ea67adfaff5a61a5f4a9
Status: Downloaded newer image for jenkins:latest
d113167ac0e303d2917fbb6de7a65e44380523440cb4dd0acbadb8cd61148736
ubuntu@ip-172-31-36-168:~$ docker ps
CONTAINER ID        IMAGE               COMMAND                  CREATED             STATUS              PORTS                               NAMES
d113167ac0e3        jenkins             "/bin/tini -- /usr/l…"   11 seconds ago      Up 10 seconds       0.0.0.0:8080->8080/tcp, 50000/tcp   pensive_hermann
```

# docker-jenkins-pipeline
