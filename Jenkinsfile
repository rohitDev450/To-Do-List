pipeline {
    agent any
    environment{
        DOCKER_TAG = "${BUILD_NUMBER}"
        DOCKER_CREDS = credentials('Docker_user') 
        KUBECONFIG = '/var/lib/jenkins/.kube/config'
    }

    stages {
        stage('Git Clone') {
            steps {
               git url: 'https://github.com/rohitDev450/To-Do-List.git', branch: 'main', changelog: false, poll: false
            }
       }
       stage('Docker Login') {
            steps {
                sh "echo $DOCKER_CREDS_PSW | docker login -u $DOCKER_CREDS_USR --password-stdin"
            }
        }
       stage('Debug Workspace') {
           steps {
             sh 'pwd'
             sh 'ls -R'
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
                 sh """
                   kubectl apply -f ${WORKSPACE}/k8s/deployment.yaml
                   kubectl apply -f ${WORKSPACE}/k8s/service.yaml
                    """
            }
        }
   }
}
