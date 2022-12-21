pipeline {
    agent any
    stages {
        stage('Build') {
            steps {
                script {
                app = docker.build("nginxcustomimage")
            }
        }
        }
        stage('Approve') {
            steps {
                 script{
                input('Do you want to proceed?')
            }
            }
        }

        stage('Push image') {
            steps {
	      withCredentials([string(credentialsId: 'dockerhub', variable: 'dockerhub')]) {
              sh ('sudo docker login -u axbivmqor9at/oracleidentitycloudservice/raghavendra.eranki@infolob.com -p ${dockerhub} phx.ocir.io')
            }
                sh "sudo docker tag nginxcustomimage phx.ocir.io/axbivmqor9at/nginxcustomimage:latest"
                sh "sudo docker push phx.ocir.io/axbivmqor9at/nginxcustomimage:latest"
            }
        }
		
		 stage('Deployment-remote-server') {
            steps {
                 sshagent(['remote-server']) {
		 sh 'ssh -o StrictHostKeyChecking=no opc@10.0.0.184 '
	         sh "sudo docker rm -f $(docker ps -a -q)"
	         sh "sudo docker run -it --name audit -d -p 80:80 phx.ocir.io/axbivmqor9at/nginxcustomimage:latest"
            }
            }
            }
        }
	}
    
