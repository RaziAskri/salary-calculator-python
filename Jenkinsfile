pipeline {
    agent any

    environment {
        DOCKER_CREDENTIALS_ID = 'dockerhub-credentials'  // Jenkins credentials ID for Docker Hub
        DOCKER_IMAGE_NAME = 'your-dockerhub-username/salary-calculator:latest'
    }

    stages {
        stage('Checkout Code') {
            steps {
                // Checkout the code from Git repository
                checkout scm
            }
        }

        stage('List Repository Contents') {
            steps {
                // List the files in the repository to verify checkout
                sh 'ls -la'
            }
        }

        stage('Run Test Command') {
            steps {
                // Run a simple command to test the environment
                sh 'echo "Repository checkout and basic command test successful!"'
            }
        }

        stage('Run Python Script') {
            steps {
                // Execute the Python script with arguments
                script {
                    // Define the arguments
                    def hoursWorked = 160
                    def hourlyRate = 25

                    // Run the Python script with the defined arguments
                    sh "python3 salary-calculator.py ${hoursWorked} ${hourlyRate}"
                }
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    // Build the Docker image
                    sh "docker build -t ${DOCKER_IMAGE_NAME} ."
                }
            }
        }

        stage('Push Docker Image') {
            steps {
                script {
                    // Log in to Docker Hub
                    withCredentials([usernamePassword(credentialsId: "${DOCKER_CREDENTIALS_ID}", usernameVariable: 'DOCKER_USERNAME', passwordVariable: 'DOCKER_PASSWORD')]) {
                        sh 'echo $DOCKER_PASSWORD | docker login -u $DOCKER_USERNAME --password-stdin'
                    }
                    
                    // Push the Docker image
                    sh "docker push ${DOCKER_IMAGE_NAME}"
                }
            }
        }
    }

    post {
        success {
            echo 'Pipeline executed successfully.'
            emailext(
                subject: "Jenkins Pipeline Successful: ${env.JOB_NAME} - Build # ${env.BUILD_NUMBER}",
                body: "The build was successful.\n\n" +
                      "Job: ${env.JOB_NAME}\n" +
                      "Build Number: ${env.BUILD_NUMBER}\n" +
                      "Build URL: ${env.BUILD_URL}\n" +
                      "Build Result: ${currentBuild.result}",
                to: 'askrirazi@gmail.com'
            )
        }
        failure {
            echo 'Pipeline execution failed.'
            emailext(
                subject: "Jenkins Pipeline Failed: ${env.JOB_NAME} - Build # ${env.BUILD_NUMBER}",
                body: "The build failed.\n\n" +
                      "Job: ${env.JOB_NAME}\n" +
                      "Build Number: ${env.BUILD_NUMBER}\n" +
                      "Build URL: ${env.BUILD_URL}\n" +
                      "Build Result: ${currentBuild.result}",
                to: 'askrirazi@gmail.com'
            )
        }
    }
}
