pipeline {
    agent any
    environment {
    PATH = "/opt/tomcat/apache-maven-3.8.7/bin:$PATH" 
    DOCKERHUB_CREDENTIALS = credentials('DockerHub')
    def junit = '**/target/surefire-reports/TEST-*.xml'
     }
    stages{
        stage('Git CheckOut'){
            steps{
                git 'https://github.com/ankupsatpute/simple-app-final.git' 
                echo "Git Checkout Completed"
               }
            }
        
         stage('Maven Build'){
                steps{
                    sh 'mvn package'
                }  
            }
        stage('Check Code Coverage'){
             steps{
                    junit "${env.junit}"
                    echo 'The Junit is Sucessfull'
                    jacoco ()
                    echo 'The Code Coverage is Sucessfull'
                }
            }
        stage ('Deploy'){
            steps{
                sshagent(['Tomcat']) {
            sh "scp -o StrictHostkeyChecking=no  /var/lib/jenkins/workspace/sample/target/*.war ec2-user@172.31.7.56:/opt/apache-tomcat-9.0.70/webapps"
                         }
            }
        }
    }
}
