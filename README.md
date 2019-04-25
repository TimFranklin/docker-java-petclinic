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

#Troubleshooting

The `run` script maps the agent's `.contrast` directory to `./live-fs`.  If
you are having trouble with the agent, that's where you will find the log files
and such.
