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
                    tar -zcvf ../package.tar.gz ./
                """

                archiveArtifacts "../package.tar.gz"
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
