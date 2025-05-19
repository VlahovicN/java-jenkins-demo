pipeline {
agent {
    docker {
        image 'maven:3.8.6-openjdk-17'
        args '-u root:root -v /var/run/docker.sock:/var/run/docker.sock'
    }
}
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
                sh 'docker build -t java-demo-app .'
            }
        }
    }
}

