@Library("demo") _
pipeline{
    agent any
    environment {
    PATH = "/opt/apache-maven-3.8.7/bin:$PATH"
    deploy = '172.31.7.56'
     //-------------------Nexus Details-----------------//
        def CRDID = 'nexus'
        def NXURL = '15.206.82.196:8081'
        def NXVRN = 'nexus3'
        def PROTO = 'http'
        def REPO  = 'sample'
     }
    
    stages{
      /*stage('GIT_Checkout') {
        steps {
          script{
          checkout(
                 [
               $class: 'GitSCM',
                   extensions: [
                                 [
                    $class: "PreBuildMerge",
                         options: [
                            mergeTarget: "master",
                           fastForwardMode: "FF",
                           mergeRemote: "origin",
                           mergeStrategy: "RECURSIVE_THEIRS",
                           userRemoteConfigs: [[url: 'https://github.com/ankupsatpute/demo.git']]
                                  ],
                               ],
                            ],
                         ]
                     )
                }
             }   
          }*/
    stage('Git Checkout'){
        steps{
             checkout scmGit(branches: 
             [[name: "$BRANCH_NAME"]], 
            extensions: 
                 [[$class: 'PreBuildMerge', 
                  options: [
                   mergeRemote: 'origin',
                   fastForwardMode: "NO_FF",
                   mergeStrategy: "RECURSIVE_THEIRS",
                   mergeTarget: 'master']]], 
                   userRemoteConfigs: 
                    [[name: 'origin', 
                   refspec: '+refs/pull-requests/${pullRequestId}/*:refs/remotes/origin/pr/${pullRequestId}/*', 
                   url: 'https://github.com/ankupsatpute/demo.git']])
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
       /* stage('SonarQube'){
            steps{
                script{
                    sonarQube.sonarQube('Ansible','http://65.1.100.239:9000','7437925915ba82d0b5f6a5f736f43aac5f412bed')
                }
            }
        }*/
        
        /*stage('Upload the Artifact'){
            steps{
                script{
                  def mavenPom = readMavenPom file: 'pom.xml'
                  
                    nexusArtifactUploader artifacts:[
                     [artifactId: "${mavenPom.artifactId}",
                     classifier: '', 
                     file: "target/${mavenPom.artifactId}-${mavenPom.version}.${mavenPom.packaging}",
                     type: "${mavenPom.packaging}"]
                     ],
                     credentialsId: "${env.CRDID}",
                     groupId: "${mavenPom.groupId}",
                     nexusUrl: "${env.NXURL}",
                     nexusVersion: "${env.NXVRN}", 
                     protocol: "${env.PROTO}", 
                     repository: "${env.REPO}", 
                     version: "${mavenPom.version}"
                 }
            }
        }*/
        
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
