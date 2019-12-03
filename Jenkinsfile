pipeline {
    agent {
        docker { image 'centos' }
    }
    stages {
        stage('Test') {
            steps {
                withDockerContainer('centos') {
                    sh "ls"
                }
            }
        }
    }
}
