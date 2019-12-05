pipeline {
    agent {
        docker {
            image 'babibe2211/jenkin_php'
        }
    }
    stages {
        stage('Prepare') {
            steps {
                sh 'rm -rf *'
                sh 'git clone https://github.com/pmbibe/Docker'
                sh "chmod -R 755 Docker"
            }
        }
        stage('Test') {
            steps {
                echo "--------------------Test Stage---------------------"
                sh "cd Docker && pwd && ant"
            }
        }
        stage('Deploy') {
            steps {
                echo "--------------------Deploy Stage---------------------"
                junit 'Docker/build/logs/*.xml'
                sh "pwd"
                sh "Docker/Deploy.sh"
            }
        }
    }
}
