def deploy(){
       sh """
         scp -v -o StrictHostkeyChecking=no $WORKSPACE/target/*.war ec2-user@172.31.7.56:/opt/apache-tomcat-9.0.70/webapps
         """
    }
