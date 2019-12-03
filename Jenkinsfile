pipeline {
    agent {
        docker { image 'centos7' }
    }
    stages {
        stage('Test') {
            steps {
                sh 'whoami'
            }
        }
    }
}
