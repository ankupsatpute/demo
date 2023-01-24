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
        
        /*stage('Git CheckOut'){
            steps{
              git branch: '$BRANCH_NAME', changelog: false, poll: false, url: 'https://github.com/ankupsatpute/demo.git'
               echo "Git Checkout Completed"            
               }
            }*/
        stage('Checkout'){
            steps{
                checkout scmGit(branches: 
                [[name: '${ghprbActualCommit}']], 
                       extensions: [], 
                      userRemoteConfigs: 
                    [[credentialsId: 'Git_Ankush', 
                refspec: '+refs/pull/*:refs/remotes/origin/pr/*', 
                    url: 'https://github.com/ankupsatpute/demo.git']])
            }
        }
        
      stage('Build Code'){
             steps{
                sh"mvn package"
               }
           }
        
     
    }
}
