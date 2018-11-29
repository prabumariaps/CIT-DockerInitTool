pipeline {
    agent none
    stages {
        stage('Build') {
            agent {
                docker {
                    image 'ubuntu'
                }
            }
            steps {
                script {
                    def doesJavaRock = input(message: 'Do you like Java?', ok: 'Yes',
                        parameters: [booleanParam(defaultValue: true,
                        description: 'If you like Java, just push the button',name: 'Yes?')])

                    echo "Java rocks?:" + doesJavaRock
                }
            }
        }
    }
}
