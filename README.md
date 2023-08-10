# demo-jenkins project
#### You can find deployed and working solution on my server - http://5.180.174.20:8080/ 
#### With this project you could deploy your own Jenkins to run autotests or create some other CI/CD pipelines. 

The project will help you build Jenkins controller image by [jenkins.Dockerfile](jenkins%2Fjenkins.Dockerfile),
run the image in docker container, generate Jenkins jobs via jenkins-job-builder and get working Jenkins controller at the end.


# How to deploy the Jenkins controller
1. You need to have Docker be installed
   ([Link to how install Docker](https://docs.docker.com/engine/install/ubuntu/)) 
2. Clone the repository: 
    
    ```git clone https://github.com/a-blinkov/demo-jenkins.git```
3. Go to the jenkins folder:

    ```cd /<project directory>/demo/jenkins```
4. Execute docker compose up command in detached mode:
     
    ```docker compose up -d```
   
   It will build and run docker container
    >    [!NOTE]  
    Building the image takes around 25 minutes, so be patient ;)
  
5. After the container built and run, execute following commands:
    
    1.```docker exec -it jenkins bash``` to get the code for unlock Jenkins
    
    You will see the message from Jenkins with unlocking code, **copy it**. 

      2.```/etc/init.d/docker start``` to run docker inside the controller   

6. Open the Jenkins on any web-browser (```*computer_ip*:8080```) 
   
    You will see an unlocking page. Paste previously copied code and proceed. 
7. You are amazing. Jenkins is ready to use!

## Jenkins jobs usage 
To create all project's built-in jobs, run the script:
   
   ```jenkins-jobs --flush-cache --conf jenkins/linux.ini --server local-jenkins update jenkins/jobs/ $JOB_NAMES```  
It will create TWO jobs:

#### 1. AUTO_UPDATE_JENKINS_JOBS
Which can be used further to automatically create Jenkins jobs. 
The job will take all jobs which would be placed in [jobs](jenkins%2Fjobs) folder.

>[How to create jobs using jenkins-job-builder](https://jenkins-job-builder.readthedocs.io/en/latest/definition.html)

#### 2. DEMO_BASE_TEST

Which can be used to run autotests in docker containers. 
The job will run pytest in docker container. 
>[!INFO]  
> You can choose exact tests by passing path to chosen tests in BASE_PATH parameter. 

There are just some test mocks for demo purposes in the project.

