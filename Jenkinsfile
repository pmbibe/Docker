node('master') {
    stage('Build and Test code') {
        echo "--------------------Test Stage---------------------"
        withDockerContainer('babibe2211/jenkin_php') {
        sh 'rm -rf *'
        sh 'git clone https://github.com/pmbibe/TestRocketeer'
        sh "chmod -R 775 *"
        sh "cd money && ant"
        }
    }
    stage('Deployment to Staging') {
            echo "Deploying to Staging"
            sh """
                rocketeer deploy --on="staging"
               """
     }
    stage('Deployment to Production') {
       env.CHOICE = input(message: 'Do you want deploy to Production ?',
                        parameters: [booleanParam(defaultValue: true, description: '',name: 'OK?')])
        if (CHOICE == "true")
            {
            echo "Deploying to Production"
            sh """
                rocketeer deploy --on="production"
               """
            }
     }
    stage('Rollback') {

        env.ROLLBACK = input(message: 'Do you want rollback to previous version ?',
                        parameters: [booleanParam(defaultValue: true, description: '',name: 'Yes?')])
        if (ROLLBACK == "true")
            {
            env.LIST_VERSION_AVAILABLE = sh ( script: """
                  ssh root@192.168.141.203 ls /srv/Hello/releases > hello.txt && cat hello.txt
                  """,
                  returnStdout: true )
            env.ROLLBACK_VERSION = input message: 'What version number do you want to rollback to Production environment?', ok: 'Release!',
                              parameters: [choice(name: 'ROLLBACK_VERSION', choices: "$LIST_VERSION_AVAILABLE", description: 'What version number do you want to rollback to Production environment?')]
            sh """
               rocketeer rollback $ROLLBACK_VERSION
               """
            }
     }
     emailext body: '''$PROJECT_NAME - Build # $BUILD_NUMBER - $BUILD_STATUS:

                        Check console output at $BUILD_URL to view the results.''', recipientProviders: [developers()], subject: '$PROJECT_NAME - Build # $BUILD_NUMBER - $BUILD_STATUS!', to: 'ducptm@vega.com.vn'
     junit 'money/build/logs/junit.xml'
     checkstyle canComputeNew: false, defaultEncoding: '', healthy: '', pattern: 'money/build/logs/checkstyle.xml', unHealthy: ''
     dry canComputeNew: false, defaultEncoding: '', healthy: '', pattern: 'money/build/logs/pmd-cpd.xml', unHealthy: ''
     pmd canComputeNew: false, defaultEncoding: '', healthy: '', pattern: 'money/build/logs/pmd.xml', unHealthy: ''
     plot csvFileName: 'plot-35267617-304b-44d8-9f2e-dbd479a59c89.csv', csvSeries: [[displayTableFlag: false, exclusionValues: '', file: 'money/build/logs/phploc.csv', inclusionFlag: 'OFF', url: '']], group: 'phploc', numBuilds: '50', style: 'line', title: 'Lines of Code', yaxis: 'Lines of Code'
}
