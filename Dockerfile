FROM tomcat:8
ADD https://springpetclinicjarfile.s3-us-west-2.amazonaws.com/ride.war /usr/local/tomcat/webapps
EXPOSE 8080
MAINTAINER "satish"