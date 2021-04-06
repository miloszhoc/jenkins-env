FROM ubuntu:latest
MAINTAINER 'miloszhoc@gmail.com'
RUN apt-get update && \
    apt-get install default-jdk -y && \
    apt-get install python3 -y && \
    apt-get install python3-pip -y && \
    apt-get install git -y && \
    apt-get install vim -y && \
    apt-get install -y openssh-server && \
    echo "    PasswordAuthentication yes" >> /etc/ssh/ssh_config && \
    adduser --disabled-password --gecos "" jenkins && \
    echo "jenkins:jenkins_password" | chpasswd && \
    mkdir /home/jenkins/jenk && \
    chown -R jenkins /home/jenkins/jenk && \
    usermod -aG sudo jenkins && \
    python3.8 -m pip install docker-compose

CMD service ssh restart ; tail -f /dev/null
