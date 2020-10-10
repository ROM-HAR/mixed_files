#!groovy
pipeline {
    agent any
    environment{
        AWS_ACCESS_KEY_ID = "${env.AWS_ID_USR}"
        AWS_SECRET_ACCESS_KEY = "${env.AWS_ID_PSW}"
        ANSIBLE_PLAYBOOK = "./playbook.yml"
    }
    stages {
        stage('Create AWS AMI for Notejam Service'){
            steps{
                echo "Create AWS AMI using Packer"
                sh "rm manifest.json -f"
                sh "packer validate  -var 'playbook=${ANSIBLE_PLAYBOOK}' -var 'aws_access_key=${AWS_ACCESS_KEY_ID}' -var 'aws_secret_key=${AWS_SECRET_ACCESS_KEY}' packer.json"
                sh "packer build  -var 'playbook=${ANSIBLE_PLAYBOOK}' -var 'aws_access_key=${AWS_ACCESS_KEY_ID}' -var 'aws_secret_key=${AWS_SECRET_ACCESS_KEY}' packer.json"
                sh "cat manifest.json | jq .builds[0].artifact_id | tr -d '\"' | cut -b 11- > .ami"  
                script {
			AMI_ID = readFile('.ami').trim()
		}
            }
        }     
         
	stage('Deploy newly created AMI'){
	    steps{
		sh "terraform init"
		sh "terraform plan -var \"ami_id=${AMI_ID}\" "
		sh "terraform apply -var \"ami_id=${AMI_ID}\" "
	    }
	}
    }
}
