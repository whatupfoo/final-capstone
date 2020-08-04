# Cloud DevOps Capstone Project

## Overview
This project aims to develop a CI/CD pipeline for microservices applications with blue/green deployment. The CI step includes a simple linter, and the CD steps include:
- Pushing the built Docker container(s) to the Docker repository (you can use AWS ECR, create your own custom Registry within your cluster, or another 3rd party Docker repository) ; and
- Deploying these Docker container(s) to a small Kubernetes cluster. For your Kubernetes cluster you can either use AWS Kubernetes as a Service, or build your own Kubernetes cluster. To deploy your Kubernetes cluster, use either Ansible or Cloudformation. Preferably, run these from within Jenkins as an independent pipeline.

## Steps
<details>
<summary>Click to expand</summary>

- Ubuntu 18.04
- Install jenkins & plugins
```
Jenkins plugins: 

Amazon Web Services SDK 
Ansible plugin
Ant plugin
Blue Ocean
CloudBees AWS Credentials Plugin
Docker Pipeline
GitHub Pipeline for Blue Ocean
Pipeline: AWS Steps
```

- Add IAM policy for blue/green deployment

- Add AWS credentials in Jenkins

- Add Docker credentials in Jenkins

- [Install docker](https://www.digitalocean.com/community/tutorials/how-to-install-and-use-docker-on-ubuntu-18-04)

- [Install dependencies to deploy cluster with AWS EKS](https://docs.aws.amazon.com/eks/latest/userguide/getting-started-eksctl.html)




</details>

## Screenshots requirements

## Problems I ran into / Lessons Learned 

<details>

<summary>Click here to expand</summary>

- Unable to push to docker using Jenkins, even after adding docker credentials to Jenkins. Finally found a way to have Jenkins use docker credentials with `withDockerRegistry([ credentialsId: "dockerhub", url: "" ])`.

- Installing `kubectl` on Ubuntu instead of Jenkins caused issues where Jenkins is unable to run `kubectl` commands.  My workaround is using `sudo su ubuntu -c` to run it.
</details>

