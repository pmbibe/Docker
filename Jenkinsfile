pipeline {
    agent {
        docker { image 'php:5.6-cli' }
    }
    stages {
        stage('Test') {
            steps {
                 sh 'php --version && pwd'
            }
        }
    }
}
