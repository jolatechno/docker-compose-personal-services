FROM ubuntu:latest

ARG DEBIAN_FRONTEND=noninteractive # disable install questions
ARG SSH_USER=test
ARG SSH_PASWD=test
ARG LIBS=

ENV SSH_USER ${SSH_USER}
ENV SSH_PASWD ${SSH_PASWD}
ENV LIBS ${LIBS}

RUN echo 'user='$SSH_USER', paswd='$SSH_PASWD', installing '$LIBS''

RUN apt update && apt install  openssh-server sudo $LIBS -y
RUN useradd -rm -d /home/ubuntu -s /bin/bash -g root -G sudo -u 1000 $SSH_USER
RUN  echo ''$SSH_USER':'$SSH_PASWD'' | chpasswd
RUN service ssh start
EXPOSE 22
CMD ["/usr/sbin/sshd","-D"]
