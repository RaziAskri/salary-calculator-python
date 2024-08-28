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
    }

    post {
        success {
            echo 'Pipeline executed successfully.'
        }
        failure {
            echo 'Pipeline execution failed.'
        }
    }
}
