def codeCoverage(){
    sh 'chmod +x $WORKSPACE/target/surefire-reports/TEST-*.xml'
    sh '$WORKSPACE/target/surefire-reports/TEST-*.xml'
     }
