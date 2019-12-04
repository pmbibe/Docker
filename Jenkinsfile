pipeline {
    agent { dockerfile true }
    stages {
        stage('Test') {
            steps {
                sh 'php --version'
                sh 'whoami'
                sh 'sudo git clone https://github.com/pmbibe/Docker'
            }
        }
    }
}
