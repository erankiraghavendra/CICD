pipeline {
    agent any

    stages {
        stage('Build') {
            steps {
                app = docker.build("tunnudocker/nginxcustomimage")
            }
        }
        stage('Approve') {
            steps {
                input('Do you want to proceed?')
            }
        }
        stage('Push image') {
            steps {
               docker.withRegistry('https://registry.hub.docker.com', 'docker-hub-credentials') {
            app.push("${env.BUILD_NUMBER}")
            app.push("latest")
               }
            }
        }
    }
}