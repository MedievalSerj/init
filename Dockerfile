FROM debian:jessie

RUN apt-get update && \
    apt-get install zsh -y && \
    apt-get install git -y && \
    apt-get install wget -y && \
    apt-get install openssh-server -y && \
    apt-get clean

RUN wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | zsh || true

WORKDIR /init
CMD ["zsh"]
