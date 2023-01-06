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
          
    }
}
def getDockerTag(){
    def tag = sh script: 'git rev-parse HEAD', returnStdout: true
    return tag
}
