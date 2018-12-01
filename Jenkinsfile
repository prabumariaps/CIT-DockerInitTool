pipeline {
    agent none
    stages {
        stage('Package') {
            agent {
                docker {
                    image 'ubuntu'
                }
            }
            steps {
                sh """
                    mkdir package
                    cp -R ./code ./package/code
                    cp -R ./installer ./package/installer
                    cp -R ./src ./package/src
                    tar -zcvf package.tar.gz ./package/
                """

                archiveArtifacts "package.tar.gz"
            }
        }
        stage('Script Installer') {
            agent {
                docker {
                    image 'ubuntu'
                }
            }
            steps {
                archiveArtifacts "installer/installer.sh"
            }
        }
    }
}
