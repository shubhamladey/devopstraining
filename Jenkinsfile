pipeline {
    agent any

    stages {
        stage('Test Docker') {
            steps {
                sh 'docker version'
                sh 'docker container run -dt --name helloapp nginx:latest'
            }
        }
    }
}

sudo usermod -aG docker jenkins
sudo systemctl restart jenkins


pipeline {
    agent any

    environment {
        IMAGE_NAME = "shubhamladey7/dellapp"
        TAG = "latest"
    }

    stages {

        stage('Checkout Code') {
            steps {
                checkout scm
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    docker.build("${IMAGE_NAME}:${TAG}")
                }
            }
        }

        stage('Login to Docker Hub') {
            steps {
                withCredentials([usernamePassword(
                    credentialsId: 'dockerhub-creds',
                    usernameVariable: 'USER',
                    passwordVariable: 'PASS'
                )]) {
                    sh 'echo $PASS | docker login -u $USER --password-stdin'
                }
            }
        }

        stage('Push Image') {
            steps {
                sh "docker push ${IMAGE_NAME}:${TAG}"
            }
        }
    }

    post {
        success {
            echo 'Docker image pushed successfully!'
        }
    }
}

vim Dockerfile
FROM nginx:alpine
COPY index.html /usr/share/nginx/html/

vim index.html
HEllo world welcome to jenkins

