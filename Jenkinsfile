pipeline {
    agent any

    environment {
        // Define any environment variables you might need
        DOCKER_REGISTRY = 'your-docker-registry'
        DOCKER_IMAGE = 'your-image-name'
        GIT_REPO = 'https://github.com/your-repo.git'
    }

    stages {
        stage('Checkout') {
            steps {
                // Checkout code from GitHub
                git url: "${env.GIT_REPO}", branch: 'main'
            }
        }
        
        stage('Setup Python Environment') {
            steps {
                script {
                    // Setup Python environment (optional)
                    // Assuming you have a requirements.txt file
                    sh 'python3 -m venv venv'
                    sh './venv/bin/pip install -r requirements.txt'
                }
            }
        }
        
        stage('Lint') {
            steps {
                script {
                    // Lint your Python code (optional)
                    sh './venv/bin/flake8 .'
                }
            }
        }
        
        stage('Test') {
            steps {
                script {
                    // Run your Python tests (optional)
                    sh './venv/bin/python -m unittest discover'
                }
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
                    // Log in to Docker Hub (or your Docker registry)
                    sh "echo $DOCKER_HUB_PASSWORD | docker login -u $DOCKER_HUB_USERNAME --password-stdin"
                    // Push Docker image
                    sh "docker push ${DOCKER_REGISTRY}/${DOCKER_IMAGE}:latest"
                }
            }
        }
        
        stage('Deploy') {
            steps {
                script {
                    // Deploy Docker container (example using docker-compose)
                    sh 'docker-compose down'
                    sh 'docker-compose up -d'
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
            // Notify success (optional)
            echo 'Deployment succeeded!'
        }
        failure {
            // Notify failure (optional)
            echo 'Deployment failed!'
        }
    }
}
