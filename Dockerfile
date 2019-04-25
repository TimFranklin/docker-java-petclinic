FROM ubuntu:latest as builder
WORKDIR /root/src
RUN apt update && apt -y upgrade && apt -y install git openjdk-8-jdk maven
RUN git clone https://github.com/contrast-community/spring-petclinic
WORKDIR /root/src/spring-petclinic
RUN update-alternatives --set java /usr/lib/jvm/java-8-openjdk-amd64/jre/bin/java
# No need to set javac
ENV JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64
RUN mvn package

FROM openjdk:8-jre-alpine
WORKDIR /app
COPY --from=builder /root/src/spring-petclinic/target/spring-petclinic-\*.jar ./spring-petclinic.jar
CMD java -javaagent:contrast.jar -jar spring-petclinic.jar
EXPOSE 8080
