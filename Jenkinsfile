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
              sh"mvn sonar:sonar \
               -Dsonar.projectKey=Ansible \
               -Dsonar.host.url=http://13.235.78.9:9000 \
              -Dsonar.login=7e9c0ba9c26ee66ae4e0d87ea5fa1b2e2b8f7fc4"
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
