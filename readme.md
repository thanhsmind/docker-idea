# IDEA IntelliJ

## Supported tags

* `2018`, `2018.3`, `2018.3.1`, `latest` ([Dockerfile](https://github.com/xylphid/docker-idea/blob/master/2018/Dockerfile))

## How to use this image

The easier way to use this image is to execute the shell script available in repository :
```
#!/bin/sh

# Configure workspace root dir
WORKSPACE=/opt/git

# Configure X-Authority
XSOCK=/tmp/.X11-unix
XAUTH=/tmp/.phpstorm.xauth
if [ ! -f $XAUTH ]; then
    touch $XAUTH
    xauth nlist $DISPLAY | sed -e 's/^..../ffff/' | xauth -f $XAUTH nmerge -
fi

# Create configuration directory
if [ ! -d "/home/${USER}/.IntelliJIdea2018.3.1" ]; then
    mkdir -p /home/${USER}/.IntelliJIdea2018.3.1
fi

docker run --rm \
    --name phpstorm \
    -a stdout \
    -a stderr \
    -e DISPLAY \
    -e XAUTHORITY=${XAUTH} \
    -v ${XAUTH}:${XAUTH}:rw \
    -v $XSOCK:$XSOCK:rw \
    -v ~/.IntelliJIdea2018.3.1:/home/idea/.IntelliJIdea2018.3.1 \
    -v ${WORKSPACE}:/workspace \
    xylphid/idea:2018.3.1 # args
```

# Quick reference

* [Idea Intellij](https://www.jetbrains.com/idea/)

## Image inheritance

This docker image inherits from [openjdk](https://hub.docker.com/_/openjdk/) image.