pipeline {
    agent { dockerfile true }
    stages {
        stage('Test') {
            steps {
                sh 'php --version'
                sh 'su -'
                sh 'sudo git clone https://github.com/pmbibe/Docker'
            }
        }
    }
}
