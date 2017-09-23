FROM centos:7
MAINTAINER gggzs (njuptgggzs@163.com)

#RUN apt-get update

#install sshd
#RUN apt-get install -y openssh-server
#RUN mkdir -p /var/run/sshd
#RUN mkdir -p /root/.ssh

#add root's password
#RUN echo "root:111111"|chpasswd
#RUN sed -i 's/without-password/yes/' /etc/ssh/sshd_config

#add a test user
#RUN useradd test
#RUN echo "test:123456"|chpasswd

#add scripts
#ADD run.sh /run.sh
#RUN chmod 755 /run.sh
ADD MYmail.ini /MYmail.ini
ADD MYsend.py /MYsend.py
RUN chmod 755 /MYsend.py

#add startUML
#RUN apt-get install -y graphviz
#RUN apt-get install -y default-jre
#ADD plantuml.jar /plantuml.jar

#EXPOSE 22

CMD ["./MYsend.py"]
