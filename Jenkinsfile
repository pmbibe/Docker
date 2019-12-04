pipeline {
    agent { dockerfile true }
    stages {
        stage('Test') {
            steps {
                sh 'pwd'
                sh 'git clone https://github.com/pmbibe/Docker'
            }
        }
    }
}
