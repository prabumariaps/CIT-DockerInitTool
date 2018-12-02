pipeline {
    agent none
    stages {

        stage('Build C') {
            agent {
                docker {
                    image 'rikorose/gcc-cmake:latest'
                }
            }
            steps {
                dir("examble/daemon"){
                    sh """
                        mkdir build || true
                        cd build
                        cmake -DCMAKE_INSTALL_PREFIX=/usr ../
                        make
                        find -name "daemon"
                        cd bin
                        mv daemon cdaemon
                    """
                    archiveArtifacts "build/bin/cdaemon"
                }
            }
        }

        stage('Build Java') {
            agent {
                docker {
                    image 'maven:3-alpine'
                    args '-v /root/.m2:/root/.m2'
                }
            }
            steps {
                dir("examble/shiro-spring-boot-sample"){
                    sh 'mvn -B -DskipTests clean package'
                    sh 'find -name "*.jar"'
                    archiveArtifacts "target/*.jar"
                }
            }
        }

        stage('Build Python') {
            agent {
                docker {
                    image 'ubuntu'
                }
            }
            steps {
                sh """
                    cp -R examble/devops-project-samples/python/flask/webapp/Application/*.* code/python/
                    cd code/python
                    ls -l
                """
            }
        }

        stage('Copy Artifacts') {
            agent {
                docker {
                    image 'ubuntu'
                }
            }
            steps {
                unarchive mapping: ['build/bin/cdaemon': 'runc']
                unarchive mapping: ['target/*.jar': 'myapp.jar']
                sh "ls -l"
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
