pipeline {
    agent any

    tools {
        maven 'Maven-3.8.7'  // Must match the name in Global Tool Configuration
    }

    environment {
        IMAGE_NAME = "eureka-server"
        CONTAINER_NAME = "eureka-server-container"
        SONARQUBE_SERVER = "SonarQube"  // Must match the name in Jenkins Global Tool Configuration
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

        stage('SonarQube Analysis') {
            steps {
                withSonarQubeEnv(SONARQUBE_SERVER) {
                    sh 'mvn sonar:sonar'
                }
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
