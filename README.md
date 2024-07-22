# salary-calculator-python
sample program to test it with Jenkins and Docker

*****************
Jenkinsfile-part
****************

Explanation:
* Checkout: Pulls the code from the specified GitHub repository.
* Setup Python Environment: Sets up a Python virtual environment and installs dependencies from requirements.txt.
* Lint: Runs a linter (like flake8) to check the code quality.
* Test: Runs unit tests to ensure code correctness.
* Build Docker Image: Builds the Docker image from the Dockerfile in the repository.
* Push Docker Image: Logs in to Docker registry and pushes the Docker image.
* Deploy: Deploys the Docker container, possibly using docker-compose.
  
* Environment Variables:
DOCKER_REGISTRY: The Docker registry URL.
DOCKER_IMAGE: The name of the Docker image to be built and deployed.
GIT_REPO: The URL of the GitHub repository.

Notes:
- Ensure that Docker is installed and running on your Jenkins agent.
- Add credentials for Docker Hub (or your Docker registry) and GitHub if required.
- Customize stages like Lint, Test, and Deploy based on your specific requirements.
- 
=> This Jenkinsfile provides a comprehensive pipeline to automate the deployment of a Python application from GitHub to Docker.
