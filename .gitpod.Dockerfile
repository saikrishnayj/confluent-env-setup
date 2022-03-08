FROM ubuntu:18.04
USER root
RUN apt-get update && apt-get install -y ca-certificates openssh-server iputils-ping curl apt-transport-https zip lsb-release gnupg git && apt-get clean && rm -rf /var/cache/apt/* && rm -rf /var/lib/apt/lists/* && rm -rf /tmp/*
RUN curl -fsSL https://get.docker.com | bash
RUN rm -Rf /usr/local/confluent
RUN curl -sL --http1.1 https://cnfl.io/cli | sh -s -- -b /opt/opschain/confluent latest
RUN chmod -R 755 /opt/opschain/confluent
RUN ln -s /opt/opschain/confluent/confluent /usr/local/bin/confluent
RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
RUN unzip awscliv2.zip
RUN ./aws/install
USER gitpod
ENV SHELL /bin/bash
