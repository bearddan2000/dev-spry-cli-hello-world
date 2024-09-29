FROM ubuntu:22.04

# ENV PATH /root/.nimble/bin:$PATH

WORKDIR /workspace

RUN apt update

RUN apt install -y git curl \
    && curl https://nim-lang.org/choosenim/init.sh -sSf | sh

RUN apt install -y gcc pkg-config libgtk-3-dev liblmdb0 libpython2.7

RUN git clone https://github.com/gokr/spry.git

WORKDIR /workspace/spry

RUN nimble install spry

WORKDIR /code

COPY bin .

# 
# CMD "./run.sh"