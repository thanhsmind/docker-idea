FROM openjdk:11-jdk-slim

ARG HOST_USER_UID=1000
ARG HOST_USER_GID=1000
ARG HOST_USER_NAME=idea
ARG HOST_GROUP_NAME=idea
ENV VERSION "2019.2.1"

LABEL maintainer.name="Thanh Nguyen"
LABEL maintainer.email="nguyenphuongthanhf@gmail.com"
LABEL version=${VERSION}
LABEL description="PyCharm IDE"

ENV IDEA_SRC		"https://download.jetbrains.com/python/pycharm-professional-2019.2.1.tar.gz"

RUN apt update \
    && apt install -y --no-install-recommends \
        curl tar \
        # PyCharm requirements
        libxext-dev libxrender-dev libxtst-dev libxi-dev libfreetype6-dev python3 fontconfig \
    && rm -rf /var/lib/apt/lists/*  \ 
    && echo 'Creating notroot user and group from host' \
    && groupadd -g ${HOST_USER_GID}  ${HOST_GROUP_NAME} \
    && useradd  -u ${HOST_USER_UID} -g ${HOST_USER_GID} -m -d /home/ide  ${HOST_USER_NAME}


RUN mkdir -p /opt/idea \
    && curl --fail --silent --show-error https://download-cf.jetbrains.com/python/pycharm-professional-${VERSION}.tar.gz \
    | tar --strip-components=1 -xzC /opt/idea

USER idea
VOLUME /home/idea
VOLUME /workspace

ENTRYPOINT ["/opt/idea/bin/pycharm.sh"]
