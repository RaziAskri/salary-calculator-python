pipeline {
    agent {
        docker {
            image 'python:3.8' // Use an official Python Docker image
            args '-u root'     // Optional: Run as root user
        }
    }

    stages {
        stage('Run Python Script') {
            steps {
                // Execute the Python script
                sh 'python salary-calculator.py 160 20'
            }
        }
    }

    post {
        success {
            echo 'Python script executed successfully.'
        }
        failure {
            echo 'Python script execution failed.'
        }
    }
}
