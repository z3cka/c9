# c9
c9 in a docker container running node 4.5.0 via nvm on debian

Find image on [Docker Hub](https://hub.docker.com/r/z3cka/c9/)

## Usage
* `docker run -d -p :80 z3cka/c9`  
* Find external port on host via `docker ps`:   
```
CONTAINER ID        IMAGE               COMMAND                  CREATED             STATUS              PORTS                                            NAMES
942d87429a7d        c942a246bd79        "/bin/sh -c '/root/.n"   58 seconds ago      Up 57 seconds       0.0.0.0:32770->80/tcp                             elated_lamport
```
* Visit `http://localhost:32770`

## Features
### Custom C9 Port
* at runtime like:
  `docker run -d --env c9port=8181 -p :8181 z3cka/c9`
* at buildtime like: _(untested)_
  #### example
  * build it: `docker build --build-arg c9port=8282 .`  
    > `...Successfully built 891d895beadf`
  * `docker run -d -p :8282 891d895beadf`