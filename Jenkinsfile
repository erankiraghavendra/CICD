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
                sh "sudo docker login -u 'bm3fq4mlfz5d/anil.bhagavatula@poonawallafincorp.com' -p 'gNMl1vbDwAq(U)Cf7A0z' bom.oci.io"
                sh "sudo docker tag nginxcustomimage bom.oci.io/bm3fq4mlfz5d/nginxcustomimage:latest"
                sh "sudo docker push bom.oci.io/bm3fq4mlfz5d/nginxcustomimage:latest"
            }
        }
        }
    }
