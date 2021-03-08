pipeline {
    agent {
        docker {
            image 'bridgecrew/jenkins_bridgecrew_runner:latest'
        }
    }
    stages {
        stage('test') {
            steps {
                script {
                    sh "/run.sh cadc031b-f0a7-5fe1-9085-e0801fc52131 https://github.com/rbenavente/terragoat"

                }
            }
        }
    }
    options {
        preserveStashes()
        timestamps()
        ansiColor('xterm')
    }
}
