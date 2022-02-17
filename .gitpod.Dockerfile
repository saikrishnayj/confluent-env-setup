FROM ubuntu:18.04
USER root
RUN apt-get update && apt-get install -y ca-certificates curl apt-transport-https lsb-release gnupg git && apt-get clean && rm -rf /var/cache/apt/* && rm -rf /var/lib/apt/lists/* && rm -rf /tmp/*
RUN curl -fsSL https://get.docker.com | bash
RUN rm -Rf /usr/local/confluent
RUN curl -sL --http1.1 https://cnfl.io/cli | sh -s -- -b /opt/opschain/confluent latest
RUN chmod -R 755 /opt/opschain/confluent
RUN ln -s /opt/opschain/confluent/confluent /usr/local/bin/confluent
USER gitpod
ENV SHELL /bin/bash
