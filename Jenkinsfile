pipeline {
  agent any
  options {
    buildDiscarder(logRotator(numToKeepStr: '5'))
  }
  environment {
    DOCKER_USER = 'tientrung30bkdn'
  }
  stages {
    stage('Build') {
      steps {
        script {
          echo "In building stage"
          withCredentials([usernamePassword(credentialsId: 'docker-hub', passwordVariable: 'DOCKER_HUB_PASS')]) {
            sh "docker build -t ${DOCKER_USER}/express-web-app:${BUILD_NUMBER} ."
            sh "echo ${DOCKER_HUB_PASS} | docker login -u ${DOCKER_USER} --password-stdin"
            sh "docker build -t ${DOCKER_USER}/express-web-app:${BUILD_NUMBER} ."
          }
        }
      }
    }
    stage('Scan') {
      steps {
        sh "trivy image ${DOCKER_USER}/express-web-app:${BUILD_NUMBER}"
      }
    }
  }
}