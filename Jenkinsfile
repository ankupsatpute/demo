@Library("Shared-Libraries") _
pipeline{
    agent any
    environment {
    PATH = "/opt/apache-maven-3.8.7/bin:$PATH"
    def junit = '**/target/surefire-reports/TEST-*.xml'
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
                  UnitTest.unittest()
                   }
               }
            }

      stage('Build Code'){
             steps{
                script{
                  BuildCode.buildCode()
                     }
                  }
               }
 
      stage('Code Coverage'){
            steps{
               script{
               CodeCoverage.codeCoverage()
               jacoco()
                  }
                }
             }

    }
}
