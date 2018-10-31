## Docker-Jenkins Workflow
 
The purpose of this guide is to show you just a way to configure your recently new installed Jenkins server in our AWS Instance.

### What will you need?

The access to the server, where we've recently installed our AWS Instance and Jenkins. You'll be required about: ssh access, read-write permissions, ssh client.

### Assumptions.

Idem.
### Let's get start with this
1. Open a browser window and go to the direction that was assigned to your Jenkins instance, based on your AWS Instance direction.
This means, go to: http://54.145.171.157:8080
Note: Replace the IP address by the assigned to your own instance, you'll be able to find this in the AWS Console like the following image:
![alt text](https://github.com/rkobismarck/docker-jenkins-pipeline/blob/master/media-content/aws-15.png "Jenkins Welcome Configuration")

2. Open your ssh terminal, and connect to the server please:
3. Once inside, go to the path that's required by your Jenkins installation we're going to retrieve our secret password.
```console
sudo su
cd /var/lib/jenkins/secrets/initialAdminPassword
ls
```

4. Take a look on the file labeled initialAdminPassword, we're going to perform the next command:
```console
tail initialAdminPassword
```

5. Copy the output of the console, and paste the data inside the browser window where it's labeled like "Administratar password" then click continue.
![alt text](https://github.com/rkobismarck/docker-jenkins-pipeline/blob/master/media-content/jenkins-config-1.png "Jenkins Welcome Configuration")

6. We're going to see a wizard in the welcome, let's select please "Install suggested plugins" this is going to install the basis for our Jenkins server.

7. Wait till it finishes.
![alt text](https://github.com/rkobismarck/docker-jenkins-pipeline/blob/master/media-content/jenkins-config-2.png "Jenkins Welcome Configuration")

8. Assign your credentials, please make your own admin user by adding this to the Jenkis server avoid using the default admin account just to stay away from any potential troubles.
![alt text](https://github.com/rkobismarck/docker-jenkins-pipeline/blob/master/media-content/jenkins-config-3.png "Jenkins Welcome Configuration")


9. Avoid setting instance configuration, just press not now.
![alt text](https://github.com/rkobismarck/docker-jenkins-pipeline/blob/master/media-content/jenkins-config-5.png "Jenkins Welcome Configuration")

10. Press start using Jenkins.
![alt text](https://github.com/rkobismarck/docker-jenkins-pipeline/blob/master/media-content/jenkins-config-6.png "Jenkins Welcome Configuration")


11. Congratulations, you're now up and running.
![alt text](https://github.com/rkobismarck/docker-jenkins-pipeline/blob/master/media-content/jenkins-config-7.png "Jenkins Welcome Configuration")
