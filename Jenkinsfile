#!groovy
pipeline {
    agent any

    environment{
        AWS_ACCESS_KEY_ID = "${AWS_ACCESS_KEY-ID}"
        AWS_SECRET_ACCESS_KEY = "${AWS_SECRET_ACCESS-KEY}"
    }
    stages {
         stage('Create AWS AMI for Notejam Service'){
            agent any
            steps{
                echo "Create AWS AMI using Packer"
                sh "/usr/bin/packer build -var 'postscript=${PACKER_POSTPROCESS}' -var 'aws_access_key=${AWS_ACCESS_KEY_ID}' -var 'aws_secret_key=${AWS_SECRET_ACCESS_KEY}' packer.json"
                  } 
          }   
    }
}    
