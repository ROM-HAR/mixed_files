#!groovy
pipeline {
    agent any
    environment{
        AWS_ACCESS_KEY_ID = ""
        AWS_SECRET_ACCESS_KEY = ""
        ANSIBLE_PLAYBOOK = "./playbook.yml"
    }
    stages {
        stage('Git Checkout'){
            steps{
                git credentialsId: 'RH', url: 'https://github.com/ROM-HAR/mixed_files'     
            }
        }
	    
        stage('Create AWS AMI for Notejam Service'){
            steps{
		withAWS(credentials: 'AWS_ID'){    
                echo "Create AWS AMI using Packer"
                sh "rm manifest.json -f"
                sh "packer validate  -var 'playbook=${ANSIBLE_PLAYBOOK}'  packer.json"
                sh "packer build  -var 'playbook=${ANSIBLE_PLAYBOOK}'  packer.json"
                sh "cat manifest.json | jq .builds[0].artifact_id | tr -d '\"' | cut -b 11- > .ami"  
                script {
			AMI_ID = readFile('.ami').trim()
		}
		}
            }
        }     
         
	stage('Deploy newly created AMI'){
	    steps{
		withAWS(credentials: 'AWS_ID'){    
		sh "terraform init"
		sh "terraform plan -var 'ami_id=${AMI_ID}' terraform_ec2.tf"
		sh "terraform apply -var 'ami_id=${AMI_ID}' terraform_ec2.tf"
		}		
	    }
	}
    }
}
