pipeline {
    agent any
    environment {
    PATH = "/opt/tomcat/apache-maven-3.8.7/bin:$PATH" 
    DOCKERHUB_CREDENTIALS = credentials('DockerHub')
    DOCKER_TAG = getDockerTag()    
     }
    stages{
        stage('Git CheckOut'){
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
        stage('Check Code Coverage'){
            when{
                branch "Dev"
            }
            steps{
                    junit '**/target/surefire-reports/TEST-*.xml'
                    echo 'The Junit is Sucessfull'
                    jacoco ()
                    echo 'The Code Coverage is Sucessfull'
                }
            }
            
         stage('Docker Build'){
            steps{
                echo "DockerBuild Started"
                sh " docker build . -t ankushsatpute/ltidockerdemo:${DOCKER_TAG}"
                echo "DockerBuild Completed"
              }
           }
          stage ('Docker Image Push'){
              steps{                  
                  sh "echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin"
                  sh "docker push ankushsatpute/ltidockerdemo:${DOCKER_TAG}"
              }
            }
        stage ('Deploy'){
            steps{
                withKubeCredentials(kubectlCredentials: [[caCertificate: '', clusterName: '', contextName: '', credentialsId: 'EKS', namespace: '', serverUrl: '']]) 
                  {
                      sh "chmod +x changeTag.sh"
                      sh "./changeTag.sh ${DOCKER_TAG}"
                      sh "kubectl apply -f pods.yml"
                      sh "kubectl apply -f service.yml"
                  }     
            }
        }
    }
}
def getDockerTag(){
    def tag = sh script: 'git rev-parse HEAD', returnStdout: true
    return tag
}
