#!/bin/sh

XSOCK=/tmp/.X11-unix
XAUTH=/tmp/.phpstorm.xauth
if [ ! -f $XAUTH ]; then
    touch $XAUTH
    xauth nlist $DISPLAY | sed -e 's/^..../ffff/' | xauth -f $XAUTH nmerge -
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
    -v /opt/git:/workspace \
    xylphid/idea:2018.3.1 # args