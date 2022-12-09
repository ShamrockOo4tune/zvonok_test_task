# Было:
# FROM ubuntu:latest

# ADD ./code /opt/coolproject/code
# WORKDIR /opt/coolproject

# RUN apt update
# RUN apt full-upgrade -y
# RUN apt install -y haproxy ssh node
# RUN apt install -y ruby-full rubygems
# RUN apt autoclean -y && rm -rf /var/cache/apt/*

# CMD ["/opt/coolproject/code/start.sh"]

# Стало:
FROM ubuntu:focal

WORKDIR /opt/coolproject/code
ADD ./code .

RUN apt-get update && \
    apt-get dist-upgrade -y && \
    apt-get install -y \
        haproxy \
        ssh \
        nodejs \
        ruby-full \
        rubygems

RUN apt-get autoclean -y && \
    rm -rf /var/cache/apt/*

CMD ["/opt/coolproject/code/start.sh"]

