FROM ubuntu
MAINTAINER gggzs (njuptgggzs@163.com)

RUN apt-get update && apt-get install -y vim cscope ctags git
RUN mkdir ~/vimscript && mkdir -p ~/.vim/bundle && git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

RUN echo "filetype off\nset rtp+=~/.vim/bundle/Vundle.vim" >> /etc/vim/vimrc.local

WORKDIR /myproject

CMD ["/bin/bash"]
