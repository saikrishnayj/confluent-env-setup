FROM ubuntu:18.04
USER root
RUN apt-get update && apt-get install -y ca-certificates curl apt-transport-https lsb-release gnupg git && apt-get clean && rm -rf /var/cache/apt/* && rm -rf /var/lib/apt/lists/* && rm -rf /tmp/*
RUN curl -fsSL https://get.docker.com | bash
RUN curl -sL --http1.1 https://cnfl.io/ccloud-cli | sh -s -- latest
RUN ccloud update --major -y
USER gitpod
ENV SHELL /bin/bash
