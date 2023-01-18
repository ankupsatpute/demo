def codeCoverage(){
    sh '$WORKSPACE/target/surefire-reports/TEST-*.xml'
     }
