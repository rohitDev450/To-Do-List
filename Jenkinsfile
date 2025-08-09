pipeline {
    agent any
    environment{
        DOCKER_TAG = "${BUILD_NUMBER}"
        DOCKER_CREDS = credentials('Docker_user') 
    }

    stages {
        stage('Git Clone') {
            steps {
                git url:'https://github.com/rohitDev450/To-Do-List.git', branch:'main'
            }
       }
       stage('Docker Login') {
            steps {
                sh "echo $DOCKER_CREDS_PSW | docker login -u $DOCKER_CREDS_USR --password-stdin"
          }
       }
        stage('Docker Build') {
            steps {
                   sh "docker build -t rohitar/to-do-list:${DOCKER_TAG} ."
            }
        }
         stage('Test Code') {
            steps {
                   echo "Code is testing by devloper"
            }
        }
        stage('Docker Image Push') {
            steps {
                sh "docker push rohitar/to-do-list:${DOCKER_TAG}"
                    }
           }
        stage('Code Deploy') {
            steps {
                  sh "docker run -d -p 8081:80 --name To-do-list rohitar/to-do-list:${DOCKER_TAG}"
            }
          }
     }
}
