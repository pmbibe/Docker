pipeline {
    agent {
        docker {
            image 'babibe2211/jenkin_php'
        }
    }
    stages {
        stage('Prepare') {
            steps {
                sh "hostname"
                //sh 'rm -rf *'
                //sh 'git clone https://github.com/pmbibe/Docker'
                //sh "chmod -R 755 Docker"
            }
        }
        stage('Test') {
            steps {
                echo "--------------------Test Stage---------------------"
                sh "chmod -R 775 *"
                sh "ant"
            }
        }
        stage('Deploy') {
            steps {
                echo "--------------------Deploy Stage---------------------"
                junit 'build/logs/*.xml'
                sh "./Deploy.sh"
                sh "git clone https://github.com/pmbibe/Ansible_Telegraf"
                sh "cd Ansible_Telegraf && ansible-playbook serverlist.yml"
            }
        }
    }
}
