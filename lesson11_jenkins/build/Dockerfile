FROM maven:3.5

# Install pacakges
RUN apt update

# Install ssh
RUN apt -y install docker.io maven git

WORKDIR /root
SHELL ["git", "clone", "https://github.com/Overdron/devOps_basic_homework.git" ]

WORKDIR /root