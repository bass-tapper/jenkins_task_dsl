pipeline {
    agent { label 'built-in' }
    stages {
        stage('Checkout Code') {
            steps {
                checkout scmGit(branches: [[name: '*/master']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/lidorg-dev/hello-world-war.git']])
            }
        }
        stage('Compile Build') {
            steps {
                sh 'mvn clean compile'
            }
        }
        stage('Run Unit Test') {
            steps {
                sh 'mvn test'
            }
        }
        stage('Package') {
            steps {
                sh 'mvn package'
                archiveArtifacts artifacts: 'target/*.war', followSymlinks: false
                chuckNorris()
                cleanWs()
            }
        }
        stage('Code Quality Analysis') {
            steps {
                echo 'Analyzing Code Quality...'
                // Add your code quality analysis steps here, e.g., running SonarQube
                sh 'mvn sonar:sonar'
            }
        }
        stage('Notification') {
            steps {
                echo 'Sending Notification...'
                // Add your notification steps here, e.g., sending an email or Slack message
                mail to: 'team@example.com',
                     subject: "Build ${currentBuild.fullDisplayName}",
                     body: "Build ${currentBuild.fullDisplayName} completed successfully."
            }
        }
    }
    post {
        always {
            echo 'Cleaning up...'
            cleanWs()
        }
    }
}
