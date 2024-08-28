pipeline {
    agent any // Use any available agent

    stages {
        stage('Run Python Script') {
            steps {
                script {
                    try {
                        // Run the Python script
                        sh 'python salary-calculator.py 160 20'
                    } catch (Exception e) {
                        echo "Error occurred: ${e.message}"
                        currentBuild.result = 'FAILURE'
                        throw e
                    }
                }
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
