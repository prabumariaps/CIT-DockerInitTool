pipeline {
    agent none
    stages {

        stage('Build C') {
            agent {
                docker {
                    image 'gcc:latest'
                }
            }
            steps {
                dir("examble/daemon"){
                    sh """
                        mkdir build
                        cd build
                        cmake -DCMAKE_INSTALL_PREFIX=/usr ../
                        make
                        sudo make install
                    """
                    archiveArtifacts "build/bin/daemon"
                }
            }
        }

        stage('Package') {
            agent {
                docker {
                    image 'ubuntu'
                }
            }
            steps {
                sh """
                    mkdir package || true
                    cp -R ./code ./package/code
                    cp -R ./installer ./package/installer
                    cp -R ./src ./package/src
                    cd ./package
                    tar -zcvf ../package.tar.gz ./
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
            post {
                always {
                    sh "rm -rf *"
                }
            }
        }
    }
}
