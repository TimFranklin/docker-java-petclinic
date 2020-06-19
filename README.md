# Contrast agent deployment in Docker - Java

This repo is a companion to the [Contrast agent deployment in Docker - Java guide](https://drive.google.com/file/d/1dlQDUVe1hSZsU8y4A9I1xgQpCYtW79z7/view?usp=sharing).

## Prerequisites

The following items should be installed in your system:

Docker

## Building

```shell
docker build -t petclinic --rm .
```

## Running

Start the container with configuration for connecting to your Contrast account.

You may use environment variables to configure Contrast:

```shell
docker run --rm -it -p 8080:8080 \
  -e CONTRAST__API__KEY=<value> \
  -e CONTRAST__API__SERVICE_KEY=<value> \
  -e CONTRAST__API__URL=<value> \
  -e CONTRAST__API__USER_NAME=<value> \
  petclinic
```

Alternatively, you may configure Contrast with an existing Contrast YAML file by mounting the YAML file as a Docker volume at the default path:

```shell
docker run --rm -it -p 8080:8080 \
  -v <path-to-yaml-file>:/etc/contrast/java/contrast_security.yaml \
  petclinic
```

See https://docs.contrastsecurity.com/installation-javaconfig.html for more on configuring the Contrast agent.
