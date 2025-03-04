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
    --name intellij-idea-2018-3-1 \
    -a stdout \
    -a stderr \
    -e DISPLAY \
    -e XAUTHORITY=${XAUTH} \
    -v ${XAUTH}:${XAUTH}:rw \
    -v $XSOCK:$XSOCK:rw \
    -v ~/.IntelliJIdea2018.3.1:/home/idea/.IntelliJIdea2018.3.1 \
    -v ${WORKSPACE}:/workspace \
    thanhsmind/idea:2018.3.1 # args
