pipeline {
    agent {
        docker { image 'php7' }
    }
    stages {
        stage('Test') {
            steps {
                 sh 'php --version'
            }
        }
    }
}
