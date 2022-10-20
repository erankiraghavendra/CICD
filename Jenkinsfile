pipeline {
    agent any
    stages {
        stage('Build') {
            steps {
                script {
                app = docker.build("tunnudocker/nginxcustomimage")
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
            docker.withRegistry('https://registry.hub.docker.com', 'docker-hub-credentials') {
            app.push("${env.BUILD_NUMBER}")
            app.push("latest")
               }
            }
        }
        }
    }
}