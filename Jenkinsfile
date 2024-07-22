pipeline {
    agent any

    environment {
        DOCKER_REGISTRY = 'docker.io'
        DOCKER_IMAGE = '28401280/salary-calculator-py'
        GIT_REPO = 'https://github.com/RaziAskri/salary-calculator-python.git'
        DOCKER_CREDENTIALS_ID = 'dockerhub-credentials-id' // Jenkins credentials ID for Docker Hub
    }

    stages {
        stage('Checkout') {
            steps {
                // Checkout code from GitHub
                git url: "${env.GIT_REPO}", branch: 'develop'
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    // Build Docker image
                    sh "docker build -t ${DOCKER_REGISTRY}/${DOCKER_IMAGE}:latest ."
                }
            }
        }

        stage('Push Docker Image') {
            steps {
                script {
                    // Log in to Docker Hub
                    docker.withRegistry('https://index.docker.io/v1/', "${DOCKER_CREDENTIALS_ID}") {
                        // Push Docker image
                        sh "docker push ${DOCKER_REGISTRY}/${DOCKER_IMAGE}:latest"
                    }
                }
            }
        }

        stage('Run Docker Container') {
            steps {
                script {
                    // Run the Docker container (adjust as necessary for your use case)
                    sh 'docker run --rm ${DOCKER_REGISTRY}/${DOCKER_IMAGE}:latest'
                }
            }
        }
    }

    post {
        always {
            // Clean up workspace
            cleanWs()
        }
        success {
            // Notify success via email
            mail(
                to: "${env.RECIPIENT_EMAIL}",
                subject: "Jenkins Build Successful: ${env.JOB_NAME} ${env.BUILD_NUMBER}",
                body: "Good news! The build ${env.JOB_NAME} ${env.BUILD_NUMBER} was successful. Check the Jenkins job at ${env.BUILD_URL}."
            )
        }
        failure {
            // Notify failure via email
            mail(
                to: "${env.RECIPIENT_EMAIL}",
                subject: "Jenkins Build Failed: ${env.JOB_NAME} ${env.BUILD_NUMBER}",
                body: "Oops! The build ${env.JOB_NAME} ${env.BUILD_NUMBER} failed. Check the Jenkins job at ${env.BUILD_URL}."
            )
        }
    }
}
