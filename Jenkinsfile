pipeline {
    environment {
        registry = "ahmedshakshak/go-violin"
        registryCredential = 'docker-creds'
        dockerImage = ''
    }

    stages{
        stage('cloning the repo') {
            steps {
                git "https://github.com/ahmedshakshak/GoViolin" 
            }
        }

        stage('building image') {
            steps {
                script {
                    dockerImage = docker.build registry + ":$BUILD_NUMBER"
                }
            }
        }

        stage('pushing image') {
            steps {
                docker.withRegistery('', registryCredential) {
                    dockerImage.push()
                }
            }
        }

        stage("removing image") {
            steps {
                sh "docker rmi $registry:$BUILD_NUMBER"
            }
        }
    }
}