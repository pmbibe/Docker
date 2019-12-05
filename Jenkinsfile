pipeline {
    agent none
    stages {
        stage('Build') {
            agent {docker  image 'babibe2211/jenkin_php'}
            steps {
                checkout scm
                sh 'rm -rf *'
                sh 'git clone https://github.com/pmbibe/Docker'
                sh "chmod -R 755 Docker"
                echo "--------------------Test Stage---------------------"
                sh "cd Docker && pwd && ant"
                junit 'Docker/build/logs/*.xml'
                sh "pwd"
                sh "Docker/Deploy.sh"            }
        }
        
    }
}
