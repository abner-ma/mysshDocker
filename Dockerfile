FROM ubuntu:16.04
MAINTAINER gggzs (njuptgggzs@163.com)

RUN apt-get update

RUN apt-get install -y texlive-full
RUN apt-get install -y latex-cjk-all
RUN apt-get install -y graphviz
RUN apt-get install -y default-jre
ADD plantuml.jar /plantuml.jar

WORKDIR /mytmp

CMD ["/bin/bash"]
