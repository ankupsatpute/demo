@Library("demo") _
pipeline{
    agent any
    environment {
    PATH = "/opt/apache-maven-3.8.7/bin:$PATH"
    
     }
    
    stages{
        stage('Cleanup Workspace') {
            steps {
                cleanWs()
                sh """
                echo "Cleaned Up Workspace For Project"
                """
            }
        }
        
        
        stage('CheckOut'){
            steps{
                script{
               echo "Git Checkout Started"
                fetchCode.gitcheckout()
               echo "Git Checkout Completed"            
               }
            }
        }
       
        stage('SonarQube Analysis'){
            when{
                branch "develop"
            }
            steps{
                withSonarQubeEnv('sonarqube-8.9.10.61524'){
                 /*  script{
                       sonarQube.sonarQube('demo','http://13.233.59.8:9000','566a9d4681874a18cef3fc46d3acae56fc252441')
                   }*/
                    sh "mvn sonar:sonar"
               }
            }
        }
        
          
        
        stage('CheckOut for PR'){
            when {
                branch "PR-*"
            }
            steps{
               script{
               echo "Git Checkout Started"
               fetchCode.gitcheckout2()
               echo "Git Checkout Completed"            
               }
            }
        }
         
     
    }
}
