FROM openjdk:11-jdk-slim

ENV VERSION "2018.3.1"

LABEL maintainer.name="Anthony PERIQUET"
LABEL maintainer.email="anthony@periquet.net"
LABEL version=${VERSION}
LABEL description="IntelliJ IDE"

ENV IDEA_SRC		"https://download.jetbrains.com/idea/ideaIU-2018.2.tar.gz"

RUN apt update \
    && apt install -y --no-install-recommends \
        curl tar \
        # IntelliJ requirements
        libxext-dev libxrender-dev libxtst-dev libxi-dev libfreetype6-dev \
    && rm -rf /var/lib/apt/lists/*

RUN mkdir -p /opt/idea \
    && curl --fail --silent --show-error https://download-cf.jetbrains.com/idea/ideaIU-${VERSION}.tar.gz \
    | tar --strip-components=1 -xzC /opt/idea

COPY docker-entrypoint.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/docker-entrypoint.sh && \
    ln -s usr/local/bin/docker-entrypoint.sh /entrypoint.sh # backwards compat

VOLUME /home/idea/.IntelliJIdea${VERSION}
VOLUME /workspace

ENTRYPOINT ["/opt/idea/bin/idea.sh"]
