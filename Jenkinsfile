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
                docker build -t green:latest .
                docker images
         """
      }
    }
    stage('Push Image') {
      steps {
        withDockerRegistry([ credentialsId: "dockerhub", url: "" ]) {
        sh """
                docker tag green:latest rwnfoo/green:latest
                docker push rwnfoo/green:latest
         """
        }
      }
    }
    stage('Deploy container') {
      steps {
        sh """
        sudo su ubuntu -c "kubectl apply -f green-deployment.json"
        """
      }
    }
  }
}