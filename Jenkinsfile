pipeline {
  agent any
  stages {
    stage('AWS Credentials') {
      steps {
        withCredentials([[$class: 'AmazonWebServicesCredentialsBinding', accessKeyVariable: 'AWS_ACCESS_KEY_ID', credentialsId: 'rwnfoo', secretKeyVariable: 'AWS_SECRET_ACCESS_KEY']]) {
        sh """  
               mkdir -p ~/.aws
               echo "[default]" >~/.aws/credentials
               echo "[default]" >~/.boto
               echo "aws_access_key_id = ${AWS_ACCESS_KEY_ID}" >>~/.boto
               echo "aws_secret_access_key = ${AWS_SECRET_ACCESS_KEY}">>~/.boto
               echo "aws_access_key_id = ${AWS_ACCESS_KEY_ID}" >>~/.aws/credentials
               echo "aws_secret_access_key = ${AWS_SECRET_ACCESS_KEY}">>~/.aws/credentials
        """
        }
      }
    }
    stage('Linting') {
      steps {
        sh "tidy -q -e *.html"
      }
    }
    stage('Build Image') {
      steps {
        sh """  
                ls
                docker build -t blue:latest .
                docker images
         """
      }
    }
    stage('Push Image') {
      steps {
        withDockerRegistry([ credentialsId: "dockerhub", url: "" ]) {
        sh """
                docker tag blue:latest rwnfoo/blue:latest
                docker push rwnfoo/blue:latest
         """
        }
      }
    }
    stage('Deploy container') {
      steps {
        sh """
        docker images
        docker ps
        ls -la
        pwd
        kubectl create -f /var/lib/jenkins/workspace/final-capstone_blue/blue-deployment.json
        """
      }
    }
  }
}