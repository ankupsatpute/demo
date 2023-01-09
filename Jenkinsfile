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
        stage('OWASP-Dependency-Check'){
              when{
                  branch "Test"
              }
              steps{
                dependencyCheck additionalArguments: '--scan /var/lib/jenkins/workspace/${JOB_NAME} --format ALL --disableYarnAudit', odcInstallation: 'OWASP-Dependency-Check' 
                dependencyCheckPublisher pattern: '**/dependency-check-report.xml', unstableNewCritical: 1, unstableNewHigh: 2, unstableTotalCritical: 1, unstableTotalHigh: 2

            }
        }
         stage('Maven Build'){
                steps{
                    sh 'mvn package'
                }  
            }
     
          /*  stage('Code Analysis With SonarQube'){
               steps{
                withSonarQubeEnv('sonarqube-8.9.10.61524'){
                    sh'mvn sonar:sonar -Dsonar.projectKey=Ansible' 
                    }
                 }
            }
            stage("Quality Gate"){
                when{
                  branch "Prod"
                   }               
            steps{
                waitForQualityGate abortPipeline: true, credentialsId: 'sonarqube-token'
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
        stage('Dynamic Security Application Testing'){
            when{
                branch "Prod"
               }
            steps{
               sh "docker run -t owasp/zap2docker-stable zap-baseline.py -t http://13.233.116.102:8080/simple-app-50.0.0 || true"  
               }
          post{
              always{
                  sh 'docker rm $(docker ps --filter status=exited -q)'
                   }
                }
        }*/               
    }
}
def getDockerTag(){
    def tag = sh script: 'git rev-parse HEAD', returnStdout: true
    return tag
}
