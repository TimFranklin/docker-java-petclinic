FROM adoptopenjdk:8-hotspot-bionic as builder
ADD https://github.com/TimFranklin/spring-petclinic-jl/archive/master.zip /source.zip
ADD https://pkg.contrastsecurity.com/api/gpg/key/public contrast.gpg
RUN apt-get update &&\
  apt-get install -y unzip gnupg2 &&\
  apt-key add contrast.gpg &&\
  echo "deb https://pkg.contrastsecurity.com/debian-public/ all contrast" > /etc/apt/sources.list.d/contrast-all.list &&\
  apt-get update &&\
  apt-get install -y contrast-java-agent &&\
  unzip /source.zip &&\
  cd /spring-petclinic-jl-master &&\
  ./mvnw package &&\
  mv /spring-petclinic-jl-master/target/spring-petclinic-*.jar /spring-petclinic.jar &&\
  rm -rf /source.zip /spring-petclinic-jl-master /root/.m2
CMD java -javaagent:/opt/contrast/contrast-agent.jar -jar spring-petclinic.jar
ENV CONTRAST__AGENT__JAVA__STANDALONE_APP_NAME="PetClinic-guide"
# configure Contrast to log to console so that Contrast logs are captured by the Docker log driver
ENV CONTRAST__AGENT__LOGGER__STDOUT=true
EXPOSE 8080
