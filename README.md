# Contrast agent deployment in Docker - Java
This repo is part the Contrast agent deployment in Docker - Java guide.
<a href="https://drive.google.com/file/d/1dlQDUVe1hSZsU8y4A9I1xgQpCYtW79z7/view?usp=sharing">See the guide here</a>

## Spring PetClinic Sample Application [![Build Status](https://travis-ci.org/spring-projects/spring-petclinic.png?branch=master)](https://travis-ci.org/spring-projects/spring-petclinic/)

## Understanding the Spring Petclinic application with a few diagrams
<a href="https://speakerdeck.com/michaelisvy/spring-petclinic-sample-application">See the presentation here</a>

## Running petclinic locally
```
	git clone https://github.com/spring-projects/spring-petclinic.git
	cd spring-petclinic
	./mvnw spring-boot:run
```

You can then access petclinic here: http://localhost:8080/

<img width="1042" alt="petclinic-screenshot" src="https://cloud.githubusercontent.com/assets/838318/19727082/2aee6d6c-9b8e-11e6-81fe-e889a5ddfded.png">

## In case you find a bug/suggested improvement for Spring Petclinic
Our issue tracker is available here: https://github.com/spring-projects/spring-petclinic/issues

## Adding the Contrast Java agent to the PetClinic application
```
	git clone https://github.com/spring-projects/spring-petclinic.git
	cd spring-petclinic
  ./build
  Download contrast.jar and contrast_security.yaml to the spring-petclinic directory
  ./run
```

## Database configuration

In its default configuration, Petclinic uses an in-memory database (HSQLDB) which
gets populated at startup with data. A similar setup is provided for MySql in case a persistent database configuration is needed.
Note that whenever the database type is changed, the data-access.properties file needs to be updated and the mysql-connector-java artifact from the pom.xml needs to be uncommented.

You could start a MySql database with docker:

```
docker run -e MYSQL_ROOT_PASSWORD=petclinic -e MYSQL_DATABASE=petclinic -p 3306:3306 mysql:5.7.8
```

# License

The Spring PetClinic sample application is released under version 2.0 of the [Apache License](http://www.apache.org/licenses/LICENSE-2.0).




Simplify packaging of the vulnerable PetClinic application, as a docker
container.

1. Clone this repo
2. `$ ./build`
3. Copy in contrast.jar and (optionally) contrast_security.yaml
4. `$ ./run`

PetClinic will be available on localhost:8080 by default.  Edit the `run`
script to put it on a different port, if desired.

The connection to the Team Server is defined via the contrast_security.yaml
file.  You can typically download that from the Team Server, in the "add
agent" workflow.

Because this is running in Docker, you may need to take care with the
Team Server URL.  For example, on Mac you may need to use the hostname
`host.docker.internal` to access Team Server running on the host system.

# Troubleshooting

The `run` script maps the agent's `.contrast` directory to `./live-fs`.  If
you are having trouble with the agent, that's where you will find the log files
and such.
