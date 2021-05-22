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

## Setup

The blue Deployment is the version that is deployed live in production. It can be accessed externally by end users via a Service with type=LoadBalancer

### Create the Blue Deployment

The Deployment will start up with python flask  containers as the application. The Deployment has a `name` and `version` label. This is significant as the Service will use these labels to switch to the green version later.