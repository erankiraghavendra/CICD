pipeline {
    agent any
    stages {
        stage('Build') {
            steps {
                script {
                app = docker.build("bm3fq4mlfz5d/anil.bhagavatula@poonawallafincorp.com/nginxcustomimage")
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
            app.push("${env.BUILD_NUMBER}")
            app.push("latest")
               }
            }
        }
        }
    }
}