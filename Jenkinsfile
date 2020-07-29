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
                docker info
                docker build -t blue:${BUILD_NUMBER} .
                docker images
         """
      }
    }
    stage('Push Image') {
      steps {
        sh """  
                dockerpath=blue
                docker login -u rwnfoo
                docker system info | grep Registry
                docker tag $dockerpath:${BUILD_NUMBER} $dockerpath:latest
                docker push $dockerpath:latest
         """
      }
    }
  }
}