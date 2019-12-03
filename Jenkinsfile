pipeline {
    agent {
        docker { image 'node:php7' }
    }
    stages {
        stage('Test') {
            steps {
                 sh 'node --version'
            }
        }
    }
}
