#!/bin/sh

USER_ID=${LOCAL_USER_ID:-9001}

echo "Docker IntelliJ (${VERSION})"
echo
echo "Initialize with UID : ${USER_ID}"
useradd -u ${USER_ID} -o -c "" -m idea
export HOME=/home/idea

echo "Launch program ..."
su idea -c "/opt/idea/bin/idea.sh $@"