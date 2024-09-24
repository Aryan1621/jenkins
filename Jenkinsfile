pipeline {
    agent any

    stages {
        stage('Checkout Code') {
            steps {
                // Checkout code from Git repository
                git branch: 'main', url: 'https://github.com/Aryan1621/jenkins.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    // Build the Docker image
              docker.build("docker", "-f /var/lib/jenkins/workspace/docker/.")

                }
            }
        }

        stage('Run Docker Container') {
            steps {
                script {
                    // Run Docker container on port 8081
                    docker.image('docker').run('-d -p 8081:8080')
                }
            }
        }
    }

    post {
        always {
            // Cleanup Docker containers
            sh 'docker container prune -f'
        }
    }
}
