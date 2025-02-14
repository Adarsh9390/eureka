pipeline {
    agent any

    tools {
        maven 'Maven-3.8.7'  // Use the configured Maven version
    }

    stages {
        stage('Checkout Code') {
            steps {
                git 'https://github.com/Adarsh9390/eureka.git'
            }
        }

        stage('Build with Maven') {
            steps {
                sh 'mvn clean package -DskipTests'
            }
        }

        stage('Run Tests') {
            steps {
                sh 'mvn test'
            }
        }
    }
}
