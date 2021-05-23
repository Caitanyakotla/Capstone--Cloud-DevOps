# Udacity Capstone Project 


## Project Overview

Capstone project for Udacity's "Cloud DevOps Engineer" Nanodegree Program.

<hr>

## Objectives

- Working with  AWS services
- Using Jenkins to implement Continuous Integration and Continuous Deployment.
- Building pipelines
- Working with CloudFormation to deploy clusters
- Building Kubernetes clusters 
- Building and deploy Docker images
- Building Docker containers in pipelines

<hr>

## Tools Used
- EKS
- CloudFormation
- BASH
- Git & GitHub
- AWS & AWS-CLI
- Python
- Flask framework.
- pip3
- Pylint
- Docker & Docker-Hub Registery
- Jenkins
- Kubernetes CLI (kubectl)
- EKS
- CloudFormation
- BASH

<hr>

## Project Steps

1. [Development](#development)
2. [Jenkins](#jenkins)
3. [Setup Kubernetes Cluster](#setup-kubernetes-cluster)
4. [CI/CD Pipeline](#ci/cd-pipeline)

<hr>

### Development

-  Python-flask application.

<hr>

- **Docker Containerization:**

    Run docker application container:

    ```
        $./run_docker.sh
    ```

<br>

- **Push docker image to docker-hub (Local manual check):**

    ```
        $./upload_docker.sh
    ```
<hr>


<br>

- **Installation guidelines Docker With Jenkins:**

    - Install docker on jenkins server.

    - Add jenkins to docker group:
        ```
        $ sudo usermod -aG docker jenkins
        ```

    - Install "Docker", "Github" jenkin's plug-in.

    - Add Docker-Hub credentials to jenkins.

<br>

## Deploy the Docker image to local Kubernetes Cluster
1. Deploy the application and service to Kubernetes
```bash
kubectl apply -f .

```

2. Check that pods, deployment and service are created and running 
```bash
kubectl get all
```

Delete the kubernetes deployment and service
```bash
kubectl delete deployment blue-flask-app green-flask-app
kubectl delete svc
kubectl delete hpa


## Setup

The blue Deployment is the version that is deployed live in production. It can be accessed externally by end users via a Service with type=LoadBalancer

### Create the Blue Deployment

The Deployment will start up with python flask  containers as the application. The Deployment has a `name` and `version` label. This is significant as the Service will use these labels to switch to the green version later.




## Project Files
**- **Application files****
  - **app.py** - This is the python=flask web application
  - **green/blue.html** - This is the default green.html/blue.html file
  - **.gitignore** - This has the files that should not be added to the git repository
**- **Docker files****
  - **Dockerfile** - This is the docker build file to containerize the app inside Docker
  - **.dockerignore** - This has the files that should not be copied when building the Docker image
**- **Script files****
  - **run_docker.sh** - This script will build the Docker image of the app and run the app inside the container
  - **upload_docker.sh** - This script uploads the Docker image to Docker hub repository
  - **run_kubernetes.sh** - This script deploys the Docker image to a Kubernetes cluster and runs the app in pods.
  
  
  
# Perform security scanning of the Docker containers
static analysis for docker image (output of image can be seen in screenshot/Vulnerablities static analysis)

# Post-deployment add testing of your application
# Zero downtime. 
Blue/green deployment allows cutover to happen quickly with no downtime.
# Instant rollback. 
You can roll back at any time during the deployment process by adjusting the load balancer to direct traffic back to the blue environment. The impact of downtime is limited to the time it takes to switch traffic to the blue environment after you detect an issue.
# Environment separation. 
Blue/green deployment ensures that spinning up a parallel green environment doesn't affect resources that support the blue environment. This separation reduces your deployment risk.

