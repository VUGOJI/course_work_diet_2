pipeline {
    agent any

    environment {
        // Replace with your DockerHub username
        DOCKERHUB_CREDENTIALS = '1'
        DOCKERHUB_USERNAME = 'vugoji'
        IMAGE_NAME = 'vugoji/cw2-server'
        IMAGE_TAG = '3' // Replace with a version if needed
    }

    stages {
        stage('Checkout Code') {
            steps {
                // Pull the latest code from the repository
                checkout scm
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    // Build the Docker image
                    sh "docker build -t ${IMAGE_NAME}:${IMAGE_TAG} ."
                }
            }
        }

        stage('Login to DockerHub') {
            steps {
                script {
                    // Log in to DockerHub using credentials stored in Jenkins
                    withCredentials([usernamePassword(credentialsId: "${DOCKERHUB_CREDENTIALS}", usernameVariable: 'DOCKER_USERNAME', passwordVariable: 'DOCKER_PASSWORD')]) {
                        sh "echo ${DOCKER_PASSWORD} | docker login -u ${DOCKER_USERNAME} --password-stdin"
                    }
                }
            }
        }

        stage('Push Docker Image to DockerHub') {
            steps {
                script {
                    // Push the Docker image to DockerHub
                    sh "docker push ${IMAGE_NAME}:${IMAGE_TAG}"
                }
            }
        }
    }

    post {
        success {
            echo 'Docker image built and pushed successfully!'
        }
        failure {
            echo 'Pipeline failed!'
        }
    }
}

