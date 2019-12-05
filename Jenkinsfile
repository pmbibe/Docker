pipeline {
    agent {
        docker {
            image 'babibe2211/jenkin_php'
        }
    }
    stages {
        stage('Test') {
            steps {
                sh 'rm -rf *'
                sh 'git clone https://github.com/pmbibe/Docker'
                sh "chmod -R 755 Docker"
                echo "--------------------Test Stage---------------------"
                sh "cd Docker && pwd && ant"
                echo "--------------------Deploy Stage---------------------"
                junit 'Docker/build/logs/*.xml'
                sh "pwd"
                sh "ls"
                sh "exit"
                sh "ls"
            }
        }
    }
}
