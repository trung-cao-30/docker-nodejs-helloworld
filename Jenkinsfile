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
        sh "docker build -t ${DOCKER_USER}/express-web-app:${BUILD_NUMBER} ."
      }
    }
    // stage('Scan') {
    //   steps {
    //     sh 'trivy darinpope/java-web-app:latest'
    //   }
    // }
  }
}