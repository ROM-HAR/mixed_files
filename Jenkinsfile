#!groovy
pipeline {
    agent none

    environment{
        AWS_ACCESS_KEY_ID = "${env.AWS_ID_USR}"
        AWS_SECRET_ACCESS_KEY = "${env.AWS_ID_PSW}"
        ANSIBLE_PLAYBOOK = " playbook.yml "
        PACKER_POSTPROCESS = "get_ami.sh"
    }
    stages {
         stage('Create AWS AMI for Notejam Service'){
            agent any
            steps{
                echo "Create AWS AMI using Packer"
                sh "/usr/bin/packer build -var 'postscript=${PACKER_POSTPROCESS}' -var 'playbook=${ANSIBLE_PLAYBOOK}' -var 'aws_access_key=${AWS_ACCESS_KEY_ID}' -var 'aws_secret_key=${AWS_SECRET_ACCESS_KEY}' packer.json"
                  } 
          }   
    }
}    
