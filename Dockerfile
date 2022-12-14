FROM tomcat:8
# Take the war and copy to webapps of tomcat
RUN mv target/*.war target/simple-app.war
COPY target/*.war /usr/local/tomcat/webapps/
RUN rm -rf target/simple-app.war
#CMD [ "/usr/local/tomcat/catalina.sh", "start" ]
