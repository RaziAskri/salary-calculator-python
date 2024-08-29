pipeline {
    agent any

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
