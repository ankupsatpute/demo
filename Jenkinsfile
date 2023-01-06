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
                    sh 'mvn clean install'
                }  
            }
         stage('Docker Build'){
            steps{
                echo "DockerBuild Started"
                sh " docker build . -t ankushsatpute/multibranch:${DOCKER_TAG}"
                echo "DockerBuild Completed"
                echo "To Scan vulnerabilities"
                sh "docker run -it --rm achore/grype ankushsatpute/multibranch:${DOCKER_TAG}"
              }
           }
          stage ('Docker Image Push'){
              steps{                  
                  sh "echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin"
                  sh "docker push ankushsatpute/multibranch:${DOCKER_TAG}"
                  sh "docker rmi ankushsatpute/multibranch:${DOCKER_TAG}"
              }
            }
          
    }
}
def getDockerTag(){
    def tag = sh script: 'git rev-parse HEAD', returnStdout: true
    return tag
}
