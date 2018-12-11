FROM ubuntu:18.04

RUN DEBIAN_FRONTEND=noninteractive apt-get update &&\
    apt-get install -y --no-install-recommends gpg-agent apt-transport-https ca-certificates curl wget software-properties-common x11-apps

RUN curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -
RUN wget -q https://packages.microsoft.com/keys/microsoft.asc -O- | apt-key add -
RUN add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu bionic stable"
RUN add-apt-repository "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main"

RUN DEBIAN_FRONTEND=noniteractive apt-get update && \
    apt-get install -y --no-install-recommends libasound2 libxtst6 docker-ce code 

COPY extensions.txt extensions.txt
RUN mkdir vscode-datadir
RUN cat extensions.txt | while read in; do code --user-data-dir vscode-datadir --install-extension "$in"; done
