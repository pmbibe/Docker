pipeline {
    agent {
        docker { image 'php:5.6-cli' }
    }
    stages {
        stage('Test') {
            steps {
                 sh "git clone https://github.com/pmbibe/Demo_jenkins"
                 sh 'php --version && pwd'
            }
        }
    }
}
