def deploy(){
       sh """
         scp -v -o StrictHostkeyChecking=no $WORKSPACE/target/*.war ec2-user@${deploy}:/opt/apache-tomcat-9.0.70/webapps
         """
    }
