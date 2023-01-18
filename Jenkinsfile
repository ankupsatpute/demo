@Library("demo") _
pipeline{
    agent any
    environment {
    PATH = "/opt/apache-maven-3.8.7/bin:$PATH"
    deployment = 172.31.7.56
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
        
      /*stage('Deploy'){
          steps{
            script{
             deploy.deploy()
                 }
               }
            }*/

    }
}
