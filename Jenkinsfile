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
                script {
            docker.withRegistry('https://bom.ocir.io/', 'oci-docker') {
            sh 'sudo docker push bom.ocir.io/bm3fq4mlfz5d/customnginx:latest'
               }
            }
        }
        }
    }
}