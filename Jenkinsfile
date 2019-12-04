pipeline {
    agent { dockerfile true }
    stages {
        stage('Test') {
            steps {
                sh 'pwd'
                sh 'hostname'
                sh 'php --version'
                sh 'php -v'
            }
        }
    }
}
