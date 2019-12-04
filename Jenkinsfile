pipeline {
    agent { dockerfile true }
    stages {
        stage('Test') {
            steps {
                sh 'php --version'
                sh 'git clone https://github.com/pmbibe/Docker'
            }
        }
    }
}
