pipeline {
    agent any
    environment {
    PATH = "/opt/apache-maven-3.8.7/bin:$PATH" 
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
          stage ('Deploy_Develop'){
                when {
                    branch 'develop'
                }
            steps{
                sshagent(['Tomcat']) {
                sh "scp -o StrictHostkeyChecking=no  /var/lib/jenkins/workspace/multibranch_develop/target/*.war ec2-user@172.31.7.56:/opt/apache-tomcat-9.0.70/webapps"
                     }
                   }
                }
            stage ('Deploy_Release'){
                when {
                    branch 'release'
                }
            steps{
                sshagent(['Tomcat']) {
                sh "scp -o StrictHostkeyChecking=no  /var/lib/jenkins/workspace/multibranch_release/target/*.war ec2-user@172.31.11.146:/opt/apache-tomcat-9.0.70/webapps"
               }
            }
        }
        stage ('Deploy_Master'){
                when {
                    branch 'master'
                }
            steps{
                sshagent(['Tomcat']) {
                sh "scp -o StrictHostkeyChecking=no  /var/lib/jenkins/workspace/multibranch_master/target/*.war ec2-user@172.31.14.112:/opt/apache-tomcat-9.0.70/webapps"
               }
            }
        }
        
   }
}
