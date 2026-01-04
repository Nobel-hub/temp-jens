pipeline {
    agent any
    environment {
        DOCKER_REPO = "nobeldhakal123/javaapp"
    }
    stages {
        stage('Compile the code') {
            steps {
                echo "Compiling the code...."
                sh "mvn clean compile"
            }
        }
        stage('Test') {
            steps {
                echo "Testing the code..."
                sh "mvn test"
            }
        }
        stage('Build the artifacts and archive it') {
            steps {
                echo "Creating the artifacts to be deployed."
                sh "mvn package"
            }
            post {
                success {
                    echo "Archiving the artifacts...."
                    archiveArtifacts artifacts: '**/*.war', followSymlinks: false
                }
            }
        }
        stage('Build the docker image') {
            steps {
                echo "Building a docker image of the java app...."
                sh "docker build -t ${env.DOCKER_REPO}:v2 ."
            }
        }
        stage('Scanning the image using Trivy') {
            steps {
                echo "Scanning CVEs using Trivy..."
                sh "trivy image --scanners vuln --severity HIGH,CRITICAL --ignore-unfixed ${env.DOCKER_REPO}:v2 --format json -o report.json"
            }
        }
        stage('Push the Docker image') {
            steps {
                echo "Pushing the docker image to the docker hub repository...."
                withDockerRegistry([credentialsId: 'docregcred', url: '']) {
                    sh "docker image push ${env.DOCKER_REPO}:v2"
                }
            }
        }
        stage("Deploy an app to Dev environment") {
            steps {
                echo "Running the image and opening the application in dev environment...."
                sh "docker rm -f myapp-dev || true"
                sh "docker container run -d --name myapp-dev -p 8081:8080 ${env.DOCKER_REPO}:v2"
            }
        }
    }
}
