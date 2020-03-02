FROM tomcat:8
COPY /home/ubuntu/ride.war /usr/local/tomcat/webapps
EXPOSE 8080
MAINTAINER "satish"          