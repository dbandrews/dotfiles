FROM ubuntu:14.04

RUN locale-gen en_US.UTF-8
RUN apt-get update && \
    apt-get install -y \
    build-essential \
    bison \
    flex \
    curl \
    ed \
    git \
    libbz2-dev \
    libreadline-dev \
    libssl-dev \
    libsqlite3-dev \
    tmux \
    vim-nox \
    zsh \
    && apt-get clean

RUN useradd -s /bin/zsh tester
ADD . /home/tester/.dotfiles
RUN chown -R tester:tester /home/tester && \
    echo 'tester ALL=(ALL) NOPASSWD:ALL' > /etc/sudoers.d/tester && \
    chmod 0440 /etc/sudoers.d/tester
USER tester

ENV HOME /home/tester
ENV TMUX y

WORKDIR /home/tester/.dotfiles
