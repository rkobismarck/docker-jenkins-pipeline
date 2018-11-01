## Jenkins Job Parametrization

The purpose of this guide is to show you just a way to parametrize an existent Jenkins-Job in your recently new installed Jenkins server in our AWS Instance.


### What will you need?
>The access to the Jenkins server, where we've recently installed our AWS Instance. You'll be required about: login.

>A previously configured Job in a static mode, but in any case with the prior information you can configure the Job in a parametrized way.
[Jenkins static job configuration](https://github.com/rkobismarck/docker-jenkins-pipeline/blob/master/Jenkins/Jobs.md "Git's")

### Assumptions.
You are trying to configure a parametrized job, in that case you're going to provide a dynamic configuration parameter to your job in this case **the branch name**

### Let's get start with this
1. Select and open the job, that you want to parametrize.

2. Click in the configure option, in the left side of the screen.
![alt text](https://github.com/rkobismarck/docker-jenkins-pipeline/blob/master/media-content/jenkins-job-parametrized-1.png "Jenkins Configure")  

3. Go to the General section, and mark **this project is parametrized**

4. Select the option **add parameter** with the option **string parameter**
![alt text](https://github.com/rkobismarck/docker-jenkins-pipeline/blob/master/media-content/jenkins-job-parametrized-2.png "Jenkins Select Parameter Type")  

5. We're going to parametrize the branch name:
![alt text](https://github.com/rkobismarck/docker-jenkins-pipeline/blob/master/media-content/jenkins-job-parametrized-3.png "Jenkins Inject Parameter Values")  

What does this mean?
> Name: The name that will receive the parameter value, or the variable were will reside the parameter.

> Default value: The value that comes by default; if no value is provided.

> Description: A brief explanation about the purpose of the parameter.

> Trim String: As like always in any programming language, please take note that this could prevent you from issues, mark this as true and stay away from troubles if you wish.

6. How to read the parameterized values inside our job?
At this moment we're going to pass the parameter value to the branch, becoming in a dynamic branch configuration.
![alt text](https://github.com/rkobismarck/docker-jenkins-pipeline/blob/master/media-content/jenkins-job-parametrized-4.png "Jenkins Read Parameter Values")  

	> The sintaxis related is the next:
	```console
		${PARAMETER_NAME}
	```
	
7. Please save the changes, and now you're able to execute the job providing the new parameters.

8. Go to the job, and press **build with parameters**

9. Provide a valid value for the parameter, and then press **build** 

![alt text](https://github.com/rkobismarck/docker-jenkins-pipeline/blob/master/media-content/jenkins-job-parametrized-5.png "Jenkins Build With Parameterized Values") 

10. Congratulations you've parametrized your first Job inside Jenkins.