# Contrast agent deployment in Docker - Java
This repo is part the Contrast agent deployment in Docker - Java guide.
<a href="https://drive.google.com/file/d/1dlQDUVe1hSZsU8y4A9I1xgQpCYtW79z7/view?usp=sharing">See the guide here</a>
The Dockerfile contains commented out examples of how to download the Contrast Java agent automatically via a curl command and how to pass Contrast agent config info via command line. To customize your own curl command, please refer to our docs <a href="https://docs.contrastsecurity.com/tools-apiaccess.html">here</a>. For more details on all Contrast Java agent configurations, please refer to our docs <a href="https://docs.contrastsecurity.com/installation-javaconfig.html">here</a>. 

## Prerequisites
The following items should be installed in your system:

Maven 3 (http://www.sonatype.com/books/mvnref-book/reference/installation.html)

## Running petclinic locally without Contrast
```
	git clone https://github.com/spring-projects/spring-petclinic.git
	cd spring-petclinic
	./mvnw spring-boot:run
```
You can then access petclinic here: http://localhost:8080/
Edit the `run` script to put it on a different port, if desired.

## Adding the Contrast Java agent to the PetClinic application

Download the contrast.jar and contrast_security.yaml from the Contrast dashboard.
Top right, select 'Add Agent', Java as agent type then select Download Agent.  
Once agent is downloaded, select 'Skip', then 'Download Config File'.

```
	git clone https://github.com/spring-projects/spring-petclinic.git
	cd spring-petclinic
	./build
	Copy the contrast.jar and contrast_security.yaml to the spring-petclinic directory
	Copy all content from the contrast_security_sample.yaml to the bottom of your contrast_security.yaml
	./run
```

In your browser, goto http://localhost:8080 to make sure the container started correctly and you
can access the application. Edit the `run`script to put it on a different port, if desired.

In the Contrast UI, you should see the application show up:
<img width="1042" alt="petclinic app in Contrast" src="https://contrastsecurity.s3.us-east-2.amazonaws.com/PetClinic+app+in+Contrast.png">

Along with the server:
<img width="1042" alt="DockerServer listed in Contrast servers" src="https://contrastsecurity.s3.us-east-2.amazonaws.com/DockerServer+found+in+Contrast+servers.png">

Both the application name and server name come from the contrast_security_sample.yaml you copied to your 
contrast_security.yaml. For more details on all Contrast Java agent configurations, please refer to our docs <a href="https://docs.contrastsecurity.com/installation-javaconfig.html">here</a>. 

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
