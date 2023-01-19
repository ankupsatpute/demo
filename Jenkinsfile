@Library("demo") _
pipeline{
    agent any
    environment {
    PATH = "/opt/apache-maven-3.8.7/bin:$PATH"
    deploy = '172.31.7.56'
     }
    
    stages{
      stage('GIT_Checkout') {
        steps {
          script{
                    fetchCode.fetchCode()
                }
              }   
            }

      stage('UnitTest'){
          steps{
              script{
                  unitTest.unittest()
                   }
               }
            }

      stage('Build Code'){
             steps{
                script{
                  buildCode.buildCode()
                     }
                  }
               }
 
      stage('Code Coverage'){
            steps{
               script{
              // codeCoverage.codeCoverage()
               jacoco()
                  }
                }
             }
        stage('SonarQube'){
            steps{
                script{
                    sonarQube.sonarQube('Ansible','http://65.1.100.239:9000','7437925915ba82d0b5f6a5f736f43aac5f412bed')
                }
            }
        }
        
    /* stage('Deploy'){
          steps{
              sshagent(['Tomcat']) {
                 script{
                   deploy.deploy()
                   }
                }
             }
           }*/

    }
}
