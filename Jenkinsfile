pipeline {
    agent any
    
    environment {
        registry = "ahmedshakshak/go-violin"
        registryCredential = 'docker-creds'
        REPORTING_EMAIL = 'ahmedshakshak.fcis@gmail.com'
        dockerImage = ''
    }

    stages{
        stage('building image') {
            steps {
                catchError {
                    script {
                        dockerImage = docker.build(registry + ":$BUILD_NUMBER")
                    }
                }
            }

            post {
                failure {
                    mail bcc: '', body: "Project: $JOB_NAME<br>Build Number: $BUILD_NUMBER<br>build URL: $BUILD_URL", cc: '', charset: 'UTF-8', from: '', mimeType: 'text/html', replyTo: '', subject: "ERROR CI: Project name -> $JOB_NAME", to: "$REPORTING_EMAIL";  
                }
            }
        }

        stage('pushing image') {
            steps {
                script {
                    docker.withRegistry('', registryCredential) {
                        dockerImage.push("latest")
                    }
                }
            }
        }

        stage("removing local image") {
            steps {
                sh "docker rmi $registry:$BUILD_NUMBER"
            }
        }
    }
}