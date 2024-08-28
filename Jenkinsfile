pipeline {
    agent any

    stages {
        stage('Verify Python Installation') {
            steps {
                sh 'which python'
                sh 'which python3'
                sh 'python --version'
                sh 'python3 --version'
            }
        }
        
        stage('Run Python Script') {
            steps {
                script {
                    try {
                        sh 'python3 salary-calculator.py 160 20'
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
