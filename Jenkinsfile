node('master') {
    stage('Build and Test code') {
        echo "--------------------Test Stage---------------------"
        withDockerContainer('babibe2211/jenkin_php') {
        sh "hostname"
        sh 'rm -rf *'
        sh 'git clone https://github.com/pmbibe/Jenkins_Dockerfile'
        sh "chmod -R 775 *"
        sh "cd Jenkins_Dockerfile && ant"
        }
    }
    env.LIST_VERSION_AVAILABLE = sh ( script: """
                  ssh root@192.168.141.203 ls /srv/Hello/releases > hello.txt && cat hello.txt
                  """,
                  returnStdout: true )
    stage('Choice Version to Deploy') {
        env.RELEASE_VERSION = input message: 'What version number do you want to release to Production environment?', ok: 'Release!',
                              parameters: [choice(name: 'RELEASE_VERSION', choices: "$LIST_VERSION_AVAILABLE", description: 'What version number do you want to release to Production environment?')]
    }
     stage('Deliver for development') {
        if (env.BRANCH_NAME == "master")
            {
            echo "Deploying to Production"

            sh """
                rocketeer deploy --on="production"
               """
            }
        if (env.BRANCH_NAME == "test")
            {
            echo "Deploying to Test"
            sh """
                rocketeer deploy --on="staging"
               """

            }
     }
     stage('Rollback') {

        env.ROLLBACK = input(message: 'Do you want rollback to previous version ?',
                        parameters: [booleanParam(defaultValue: true, description: '',name: 'Yes?')])
        if (ROLLBACK == "true")
            {
            env.ROLLBACK_VERSION = input message: 'What version number do you want to rollback to Production environment?', ok: 'Release!',
                              parameters: [choice(name: 'ROLLBACK_VERSION', choices: "$LIST_VERSION_AVAILABLE", description: 'What version number do you want to rollback to Production environment?')]
            sh """
               rocketeer rollback $ROLLBACK_VERSION
               """
            }
     }

}
