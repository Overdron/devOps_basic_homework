FROM debian:11-slim

#склонить репу boxfuse
RUN apt update
RUN apt install git -y
RUN git clone https://github.com/boxfuse/boxfuse-sample-java-war-hello.git

WORKDIR ~/boxfuse-sample-java-war-hello
RUN apt install maven -y
RUN mvn package

RUN apt install tomcat9 -y
COPY ./target/*.war /var/lib/tomcat9/webapps/
EXPOSE 8080
