//HelloWorld
pipeline {
    agent { dockerfile true }
  
  stages {
    stage('Prepare') {
      steps {
        echo "--------------------Prepare Stage---------------------"
        sh "rm -rf *"
        sh "git clone https://github.com/pmbibe/Demo_jenkins"
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
        sh "Demo_jenkins/Deploy.sh"

      }
    }
  }
}
