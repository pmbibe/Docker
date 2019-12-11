node('master') {
     stage('Hello') {
               checkout([$class: 'GitSCM', branches: [[name: '**']], browser: [$class: 'GithubWeb', repoUrl: 'https://github.com/pmbibe/Two_Branches'], doGenerateSubmoduleConfigurations: false, extensions: [[$class: 'CleanBeforeCheckout']], submoduleCfg: [], userRemoteConfigs: [[credentialsId: 'pmbibe', url: 'https://github.com/pmbibe/Two_Branches']]])
     }
    stage('Build and Test code') {
        echo "--------------------Test Stage---------------------"
        withDockerContainer('babibe2211/jenkin_php') {
        sh "hostname"
        sh 'rm -rf *'
        sh 'git clone https://github.com/pmbibe/Docker'
        sh "chmod -R 775 *"
        sh "cd Docker && ant"
        }
    }
    env.LIST_VERSION_AVAILABLE = sh ( script: """
                  ssh root@192.168.141.203 ls /home/www/HelloWorld/releases > hello.txt && cat hello.txt
                  """,
                  returnStdout: true )
    stage('Choice Version') {
        env.RELEASE_VERSION = input message: 'User input required', ok: 'Release!',
                              parameters: [choice(name: 'RELEASE_VERSION', choices: "$LIST_VERSION_AVAILABLE", description: 'What version number do you want to release to Production environment?')]
    }

     stage('Deliver for development') {
        if (env.BRANCH_NAME == "master")
            {
            echo "Deploying to Production"
            }
        if (env.BRANCH_NAME == "test")
            {
            echo "Deploying to Test"
            }
     }
     stage('Rollback') {

        env.ROLLBACK = input(message: 'Do you want rollback to previous version ?', ok: 'Yes',
                        parameters: [booleanParam(defaultValue: true, description: '',name: 'Yes?')])
        if (ROLLBACK == "true")
            {
            sh """
               hostname
               """
            }
     }

}




