pipeline {
    agent any

    tools {
        maven 'maven-3.9'
        jdk 'OpenJDK 17'
    }

    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Build') {
            steps {
                sh 'mvn clean package -DskipTests=false'
            }
        }

        stage('Unit Tests') {
            steps {
                sh 'mvn test'
                junit 'target/surefire-reports/*.xml'
            }
        }

        stage('Build Docker Image') {
            steps {
                // 🔧 IZMENJENO: pokušaj sa sudo, ako ne može, fallback na običan docker (ako user ima prava)
                sh 'sudo docker build -t java-demo-app . || docker build -t java-demo-app .'
            }
        }
    }
}

