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


    stages {
        stage('Docker Build & Push') {
            steps {
                sh '''
                docker build -t kisengeking/springboot-k8s:1.0 .
                echo "$DOCKER_PASSWORD" | docker login -u "$DOCKER_USERNAME" --password-stdin
                docker push kisengeking/springboot-k8s:1.0
                '''
            }
        }

        stage('Deploy to Kubernetes') {
            steps {
                sh '''
                kubectl apply -f k8s/
                kubectl rollout status deployment/springboot-k8s
                '''
            }
        }
    }

  }
}
