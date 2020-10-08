#!groovy
pipeline {
    agent any
    environment{
        MAJOR_VERSION = 1
        AWS_ID = credentials("AWS_ID")
        AWS_ACCESS_KEY_ID = "${env.AWS_ID_USR}"
        AWS_SECRET_ACCESS_KEY = "${env.AWS_ID_PSW}"
        ANSIBLE_PLAYBOOK = "./playbook.yml"
    }
    stages {
         stage('Create AWS AMI for Notejam Service'){
            agent any
            steps{
                echo "Create AWS AMI using Packer"
                sh "/usr/bin/packer build  -var 'playbook=${ANSIBLE_PLAYBOOK}' -var 'aws_access_key=${AWS_ACCESS_KEY_ID}' -var 'aws_secret_key=${AWS_SECRET_ACCESS_KEY}' packer.json"
                  } 
          }   
    }
}    
