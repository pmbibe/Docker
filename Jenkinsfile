pipeline {
    agent any

    stages {
        stage('Prepare') {
        agent {
            docker {
                image 'babibe2211/jenkin_php'
            }
        }
            steps {
                sh "hostname"
                //sh 'rm -rf *'
                //sh 'git clone https://github.com/pmbibe/Docker'
                //sh "chmod -R 755 Docker"
                echo "--------------------Test Stage---------------------"
                sh "chmod -R 775 *"
                sh "ant"
            }
        }
        stage('Deploy') {
       
            steps {
                echo "--------------------Deploy Stage---------------------"
                //junit 'build/logs/*.xml'
                //sh "./Deploy.sh"
                //sh "git clone https://github.com/pmbibe/Ansible_Telegraf"
                //sh "cd Ansible_Telegraf && ansible-playbook serverlist.yml"
                sh "hostname"
                sh "pwd"
            }
        }
    }
}
