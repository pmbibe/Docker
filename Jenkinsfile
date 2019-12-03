pipeline {
    agent {
        docker { image 'php:7.2-cli' }
    }
    stages {
        stage('Test') {
            steps {
                 sh 'php --version'
            }
        }
    }
}
