FROM jenkins/jenkins:lts-jdk11 as jenkins
USER root
# installing python
RUN apt-get update -y && apt-get upgrade -y && \
    apt-get install -y wget build-essential zlib1g-dev libbz2-dev liblzma-dev libncurses5-dev libreadline6-dev tk uuid \
    libffi-dev libsqlite3-dev libssl-dev libgdbm-dev liblzma-dev lzma lzma-dev libgdbm-dev libgdbm-compat-dev pip && \
    cd usr/local/src && \
    wget https://www.python.org/ftp/python/3.11.4/Python-3.11.4.tgz && \
    tar xzf Python-3.11.4.tgz && \
    cd Python-3.11.4 && \
    ./configure --enable-optimizations && \
    make altinstall
# Installing docker
RUN apt install -y apt-transport-https ca-certificates curl software-properties-common && \
    curl -fsSL https://download.docker.com/linux/debian/gpg | apt-key add - && \
    add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/debian/ bullseye stable" && \
    apt update -y && \
    apt install docker-ce -y
RUN pip install --upgrade pip && pip install jenkins-job-builder
WORKDIR /code
