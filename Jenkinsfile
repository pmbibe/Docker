pipeline {
    agent { dockerfile true }
    stages {
        stage('Test') {
            steps {
                sh 'pwd'
                sh 'hostname'
                sh 'ifconfig'
                sh 'php --version'
                sh 'php -v'
            }
        }
    }
}
