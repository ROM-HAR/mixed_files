#!groovy
pipeline {
    agent none

    environment{
        PACKER_POSTPROCESS = "get_ami.sh"
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
