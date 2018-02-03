FROM ubuntu:16.04
MAINTAINER gggzs (njuptgggzs@163.com)

RUN apt-get update

RUN apt-get install -y texlive-full
RUN apt-get install -y latex-cjk-all

WORKDIR /mytmp

CMD ["/bin/bash"]
