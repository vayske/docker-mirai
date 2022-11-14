FROM ubuntu:22.04

ARG DEBIAN_FRONTEND=noninteractive
ARG PYTHON_VERSION
ARG JAVA_VERSION
ARG GIT_PAT
ARG MIRAI_GIT
ARG ARIADNE_GIT
ARG BRANCH

ENV LANG=C.UTF-8
ENV BOT_HOME=/home/bot
ENV ARIADNE_DIR=${BOT_HOME}/ariadne
ENV MIRAI_DIR=${BOT_HOME}/mirai

RUN add-apt-repository ppa:deadsnakes/ppa
RUN apt-get update && apt-get install -y \
    git \
    screen \
    curl \
    openjdk-${JAVA_VERSION}-jre \
    firefox \
    firefox-geckodriver \
    python${PYTHON_VERSION} \
&&  apt-get clean \
&&  rm -rf /var/lib/apt/lists/*

# RUN mkdir -p ${BOT_HOME} \
# &&  cd ${BOT_HOME} \
# &&  git clone -b ${BRANCH} --progress ${ARIADNE_GIT} .

# RUN pip install -r ${ARIADNE_DIR}/requirements.txt

# RUN cd ${BOT_HOME} \
# &&  rm -rf .git*

# ENTRYPOINT [ "/home/rumina/docker/init.sh" ]
