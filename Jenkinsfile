pipeline {
    agent { dockerfile true }
    stages {
        stage('Test') {
            steps {
                sh 'php --version'
                sh 'whoami'
                sh 'git clone https://github.com/pmbibe/Docker'
                sh "chmod -R 755 Demo_jenkins"
            }
        }
        stage('Test') {
            steps {
                echo "--------------------Test Stage---------------------"
                sh "cd Demo_jenkins && pwd && ant"
            }
        }
        stage('Deploy') {
            steps {
                echo "--------------------Deploy Stage---------------------"
                junit 'Demo_jenkins/build/logs/*.xml'
                sh "pwd"
                //sh "Demo_jenkins/Deploy.sh"
            }
        }
    }
}
