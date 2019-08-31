#!/bin/sh

DOCKER_IMAGE=thanhsmind/pycharm2019.2.1
IDEA_VERSION=PyCharm2019.2.1
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
if [ ! -d "/home/${USER}/.${IDEA_VERSION}" ]; then
    mkdir -p /home/${USER}/.${IDEA_VERSION}
fi

docker run --rm \
    --name ${IDEA_VERSION} \
    -a stdout \
    -a stderr \
    -e DISPLAY \
    -e XAUTHORITY=${XAUTH} \
    -v ${XAUTH}:${XAUTH}:rw \
    -v $XSOCK:$XSOCK:rw \
    -v ${WORKSPACE}:/workspace \
    ${DOCKER_IMAGE} # args

# -v ~/.${IDEA_VERSION}:/home/idea/.${IDEA_VERSION} \
