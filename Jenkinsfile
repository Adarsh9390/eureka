pipeline {
    agent any

    tools {
        maven 'Maven-3.8.7'  // Ensure this Maven version is configured in Jenkins
    }

    environment {
        IMAGE_NAME = "eureka-server"
        CONTAINER_NAME = "eureka-server-container"
    }

    stages {
        stage('Checkout Code') {
            steps {
                git branch: 'main', url: 'https://github.com/Adarsh9390/eureka.git'
            }
        }

        stage('Build with Maven') {
            steps {
                sh 'mvn clean package -DskipTests'
            }
        }

        stage('Build Docker Image') {
            steps {
                sh 'docker build -t $IMAGE_NAME .'
            }
        }

        stage('Run Docker Container') {
            steps {
                script {
                    // Stop and remove existing container if running
                    sh '''
                    docker stop $CONTAINER_NAME || true
                    docker rm $CONTAINER_NAME || true
                    docker run -d --name $CONTAINER_NAME -p 8761:8761 $IMAGE_NAME
                    '''
                }
            }
        }

        stage('Clean Up Old Docker Images') {
            steps {
                sh 'docker image prune -f'
            }
        }
    }
}
