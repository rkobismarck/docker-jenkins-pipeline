## Jenkins Job

The purpose of this guide is to show you just a way to configure a Jenkins-Job in your recently new installed Jenkins server in our AWS Instance.

### What will you need?
The access to the Jenkins server, where we've recently installed our AWS Instance. You'll be required about: login into the Jenkins server in admin mode.

### Assumptions.
You have knowledge about the IP of your AWS Instance, and you have at least access to a modern browser, along with a valid credentials.

### Let's get start with this
1. Go to the URL assigned to our Jenkins server, using your browser.
This means, go to: http://34.235.160.124:8080
Note: Replace the IP address by the assigned to your own instance, you'll be able to find this in the AWS Console like the following image:
![alt text](https://github.com/rkobismarck/docker-jenkins-pipeline/blob/master/media-content/aws-15.png "Jenkins Welcome Configuration") 

2. Login, using your user and password.
![alt text](https://github.com/rkobismarck/docker-jenkins-pipeline/blob/master/media-content/jenkins-job-1.png "Jenkins Login Screen")  

3. In the left area of the screen, locate the **New item** click over the button.
![alt text](https://github.com/rkobismarck/docker-jenkins-pipeline/blob/master/media-content/jenkins-job-2.png "Jenkins New Item")  

4. By a matter of keeping things in order, it's recommended to open a new folder and keep things together if they are in the same scope. We're going to create a directory, in the box enter the name: **Istanbul**, after this in the options below select the option folder and please click, and OK to finish.
![alt text](https://github.com/rkobismarck/docker-jenkins-pipeline/blob/master/media-content/jenkins-job-3.png "Jenkins New Folder")  

5. In this step you'll be able to see the folder that you've recently created, please select the folder with a click and go inside.
![alt text](https://github.com/rkobismarck/docker-jenkins-pipeline/blob/master/media-content/jenkins-job-4.png "Jenkins Select Folder")

6. In the left area of the screen, locate the **New item** click over the button.
![alt text](https://github.com/rkobismarck/docker-jenkins-pipeline/blob/master/media-content/jenkins-job-2.png "Jenkins New Item")  

7. In the next window, please fill the name box with **IstanbulWebApp**
![alt text](https://github.com/rkobismarck/docker-jenkins-pipeline/blob/master/media-content/jenkins-job-5.png "Jenkins New Job")  

8. Please select the free style project option from the options below the item name box, and click ok.


9. Now you have the basic boilerplate for a basic Jenkis-Job.
![alt text](https://github.com/rkobismarck/docker-jenkins-pipeline/blob/master/media-content/jenkins-job-6.png "Jenkins New Boilerplate")  

10. First of all, it's a good practice to add a brief description of what's the main purpose of the job, that you're creating.


11. Please select the origin o the source code, check the option labeled as Git.
Note: We're going to deploy our demo VueJS forked app, in any case you can configure any kind of app in many stacks, but for the simplicity of this explanation we're going to proceed with a VueJS and Javascript based environment.
![alt text](https://github.com/rkobismarck/docker-jenkins-pipeline/blob/master/media-content/jenkins-job-7.png "Jenkins New Origin Git")  


12. Fill in the repository section with the HTTPS link that you've obtained from your repository.Note: This is a non authenticated repo, you can configure your SSH login to perform a clone from a secured repo, anyway in this case is optional.Here's the GitHub URL: https://github.com/rkobismarck/IstanbulProject

**Important:**

> Consider that you can configure the credentials section, in the next link you'll find the basic setup for SSH.

> Consider that you must select a valid branch, from where your code is going to be pulled and deployed, by default we're going to deploy the master version from the source code.

13. Please go to the execute section, we're going to add a step.

14. Select, execute command line.
![alt text](https://github.com/rkobismarck/docker-jenkins-pipeline/blob/master/media-content/jenkins-job-8.png "Jenkins New Execute Action")  

15. We're going to perform a basic npm commands.
```console
npm install
npm run build
```
![alt text](https://github.com/rkobismarck/docker-jenkins-pipeline/blob/master/media-content/jenkins-job-9.png "Jenkins New Execute Action CLI Commands")  


16. Select postbuild action (If you don't have this active, please install the plugin), and click in add button.

17. Select the option, send build artifacts over SSH.
What's the purpose of this option? We're going to have a certain Workspace in our Jenkins Master node, and we'll perform over the recently downloaded directory the npm install and npm run build, as result we now know that we're going to obtain a dist folder. We need to move this **dist** folder into the desired server, that you've must configured previously.

> Source files: We're going to move all the content inside the dist folder.

> Remote directory: In the target server or the destiny server, we're going to copy the content resulting of the regex above defined.

> Server: You have to select a valid configurated server for SSH connection in our Jenkins Master Instance.

18. Please, select **Save** and we're ready to continue, congratulations now you have your first Job configured.
![alt text](https://github.com/rkobismarck/docker-jenkins-pipeline/blob/master/media-content/jenkins-job-10.png "Jenkins SSH Send")  

19. Go back, into the Istanbul folder and select the Job: **IstanbulWebApp**
![alt text](https://github.com/rkobismarck/docker-jenkins-pipeline/blob/master/media-content/jenkins-job-11.png "Jenkins Select Job")  

20. In the left area, locate the **Build** please click.
![alt text](https://github.com/rkobismarck/docker-jenkins-pipeline/blob/master/media-content/jenkins-job-12.png "Jenkins Build Job")  

22. You'll see the console, and a **Sucess message** you're done we've finished.
![alt text](https://github.com/rkobismarck/docker-jenkins-pipeline/blob/master/media-content/jenkins-job-13.png "Jenkins Build Message")  
![alt text](https://github.com/rkobismarck/docker-jenkins-pipeline/blob/master/media-content/jenkins-job-14.png "Jenkins Build Sucess Message")  





