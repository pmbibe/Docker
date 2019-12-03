pipeline {
    agent {
        docker { image 'php:7.2-cli' }
    }
    stages {
        stage('Test') {
            steps {
                 sh 'php --version'
                 sh "rm -rf *"
                 sh "git clone https://github.com/pmbibe/Demo_jenkins"
                 sh "chmod -R 755 Demo_jenkins"
                 sh "pwd"
                 sh "ls -la"
            }
        }
    }
}
