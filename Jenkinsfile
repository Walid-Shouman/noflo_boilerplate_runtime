pipeline {
  agent {
    label 'docker-compose'
  }

  stages {
    stage('Verify Branch') {
      steps {
        echo "$GIT_BRANCH"
      }
    }
    stage('Docker Compose Up') {
      steps {
        sh(script: """
          docker images -a
          docker-compose up -d
          docker images -a
        """)
      }
    }
    stage('Run Tests') {
      steps {
        sh(script: 'sudo ./tests/service_up.sh')
      }
    }
    stage('Docker Compose Down') {
      steps {
        sh(script: """
          docker images -a
          docker-compose down
          docker images -a
        """)
      }
    }
  }
}

