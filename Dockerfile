FROM tomcat:8
# Take the war and copy to webapps of tomcat
#COPY target/*.war target/simple-app.war
COPY target/*.war /usr/local/tomcat/webapps/
#RUN rm -rf target/*.war
#CMD [ "/usr/local/tomcat/catalina.sh", "start" ]
