pipeline {
  agent any

  stages {
    stage('Build') {
      steps {
        sh '''
          chmod +x mvnw
          ./mvnw clean package -DskipTests
        '''
      }
    }

    stage('Docker Build & Push') {
      steps {
        sh '''
        docker build -t kisengeking/springboot-k8s:1.0 .
        docker push kisengeking/springboot-k8s:1.0
        '''
      }
    }

    stage('Deploy to Kubernetes') {
      steps {
        sh 'kubectl apply -f k8s/'
      }
    }
  }
}
