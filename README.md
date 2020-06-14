# Contrast agent deployment in Docker - Java
This repo is part the Contrast agent deployment in Docker - Java guide.
<a href="https://drive.google.com/file/d/1dlQDUVe1hSZsU8y4A9I1xgQpCYtW79z7/view?usp=sharing">See the guide here</a>
The Dockerfile contains commented out examples of how to download the Java automatically via a curl command and how to pass Contrast agent config info via command line. To customize your own curl command, please refer to our docs <a href="https://docs.contrastsecurity.com/tools-apiaccess.html">here</a>. For more details on all Contrast Java agent configurations, please refer to our docs <a href="https://docs.contrastsecurity.com/installation-javaconfig.html">here</a>. 


## Spring PetClinic Sample Application [![Build Status](https://travis-ci.org/spring-projects/spring-petclinic.png?branch=master)](https://travis-ci.org/spring-projects/spring-petclinic/)

## Running petclinic locally
```
	git clone https://github.com/spring-projects/spring-petclinic.git
	cd spring-petclinic
	./mvnw spring-boot:run
```

You can then access petclinic here: http://localhost:8080/

<img width="1042" alt="petclinic-screenshot" src="https://cloud.githubusercontent.com/assets/838318/19727082/2aee6d6c-9b8e-11e6-81fe-e889a5ddfded.png">

## Adding the Contrast Java agent to the PetClinic application

The contrast.jar and contrast_security.yaml are downloaded from the
Contrast dashboard.  Top right, select 'Add Agent', Java as agent type then
select Download Agent.  Once agent is downloaded, select 'Skip', then 'Download Config File'.

```
	git clone https://github.com/spring-projects/spring-petclinic.git
	cd spring-petclinic
	./build
	Download contrast.jar and contrast_security.yaml to the spring-petclinic directory
	./run
```

PetClinic will be available on localhost:8080 by default.  Edit the `run`
script to put it on a different port, if desired.

Because this is running in Docker, you may need to take care with the
Team Server URL.  For example, on Mac you may need to use the hostname
`host.docker.internal` to access Team Server running on the host system.

# Troubleshooting

The `run` script maps the agent's `.contrast` directory to `./live-fs`.  If
you are having trouble with the agent, that's where you will find the log files
and such.

## Database configuration

In its default configuration, Petclinic uses an in-memory database (HSQLDB) which
gets populated at startup with data. A similar setup is provided for MySql in case a persistent database configuration is needed.
Note that whenever the database type is changed, the data-access.properties file needs to be updated and the mysql-connector-java artifact from the pom.xml needs to be uncommented.

You could start a MySql database with docker:

```
docker run -e MYSQL_ROOT_PASSWORD=petclinic -e MYSQL_DATABASE=petclinic -p 3306:3306 mysql:5.7.8
```
