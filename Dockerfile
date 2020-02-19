FROM tomcat:8
ADD /var/lib/jenkins/workspace/easy/webapp/target/webapp.war /usr/local/tomcat/webapps
EXPOSE 8080
MAINTAINER "satish"          