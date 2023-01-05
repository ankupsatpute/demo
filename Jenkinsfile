pipeline {
    agent any
    environment {
    PATH = "/opt/tomcat/apache-maven-3.8.7/bin:$PATH" 
    DOCKERHUB_CREDENTIALS = credentials('DockerHub')
    }
    stages{
        stage('Git CheckOut')
        {
            steps{
                git 'https://github.com/ankupsatpute/simple-app.git' 
                echo "Git Checkout Completed"
       
            }
        }
   stage('Maven Build'){
        steps{
          sh 'mvn package'
           }
        }
    
    stage('Docker Build'){
            steps{
                echo "DockerBuild Started"
                // Build the Docker Image For a Application
                  sh "docker image build . -t $JOB_NAME:v1.$BUILD_ID"
                  sh "docker image tag $JOB_NAME:v1.$BUILD_ID ankushsatpute/$JOB_NAME:v1.$BUILD_ID"
                  sh "docker image tag $JOB_NAME:v1.$BUILD_ID ankushsatpute/$JOB_NAME:latest"
                  echo "DockerBuild Completed"
               
            }
        }
    stage ('Docker Image Push'){
        steps{
 
                  sh "echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin"
                  sh "docker push ankushsatpute/$JOB_NAME:v1.$BUILD_ID"
                  sh "docker push ankushsatpute/$JOB_NAME:latest"
                  sh "docker rmi $JOB_NAME:v1.$BUILD_ID ankushsatpute/$JOB_NAME:v1.$BUILD_ID ankushsatpute/$JOB_NAME:latest"
             
              }
        }
        
    /*stage('Deploy'){
       steps{
         withKubeConfig(caCertificate: '', clusterName: '', contextName: '', credentialsId: 'EKS', namespace: '', serverUrl: '') {
              sh "helm install simple-app simple"
            //sh "kubectl apply -f pods.yml -n test"
             //sh "kubectl apply -f pods.yml"
               }
            }
       }*/
    }
}
