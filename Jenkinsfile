pipeline {
    agent any

    environment {
        VENV_DIR = ".venv"
        PYTHON_VERSION = "3.8" // Specify the Python version you want to use
    }

    stages {
        stage('Setup Python Environment') {
            steps {
                script {
                    // Create a virtual environment
                    sh "python${PYTHON_VERSION} -m venv ${VENV_DIR}"
                    
                    // Activate virtual environment and install dependencies
                    sh """
                        source ${VENV_DIR}/bin/activate
                        pip install --upgrade pip
                        pip install -r requirements.txt
                    """
                }
            }
        }
        
        stage('Run Salary Calculator') {
            steps {
                script {
                    // Activate virtual environment and run the salary calculator script with arguments
                    sh """
                        source ${VENV_DIR}/bin/activate
                        python salary-calculator.py 160 20
                    """
                }
            }
        }
    }

    post {
        always {
            script {
                // Clean up the virtual environment
                sh "rm -rf ${VENV_DIR}"
            }
        }
        success {
            echo 'Script ran successfully!'
        }
        failure {
            echo 'Script failed to run.'
        }
    }
}
