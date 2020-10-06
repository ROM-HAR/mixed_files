#!groovy
pipeline {
    agent none

    environment{
        PACKER_POSTPROCESS = "get_ami.sh"
        AWS_ACCESS_KEY_ID = "${env.AWS_ID_USR}"
        AWS_SECRET_ACCESS_KEY = "${env.AWS_ID_PSW}"
    }
    stages {
         stage('Create AWS AMI for Notejam Service'){
            agent any
            steps{
                echo "Create AWS AMI using Packer"
                sh "/usr/bin/packer build -var 'postscript=${PACKER_POSTPROCESS}' packer.json"
                  } 
          }   
    }
}    
