FROM openjdk:11-jdk-slim

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
    && rm -rf /var/lib/apt/lists/*

RUN mkdir -p /opt/idea \
    && curl --fail --silent --show-error https://download-cf.jetbrains.com/python/pycharm-professional-${VERSION}.tar.gz \
    | tar --strip-components=1 -xzC /opt/idea

COPY docker-entrypoint.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/docker-entrypoint.sh && \
    ln -s usr/local/bin/docker-entrypoint.sh /entrypoint.sh # backwards compat

VOLUME /home/idea/.IntelliJIdea${VERSION}
VOLUME /workspace

ENTRYPOINT ["/opt/idea/bin/pycharm.sh"]
