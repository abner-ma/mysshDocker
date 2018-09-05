FROM ubuntu
MAINTAINER gggzs (njuptgggzs@163.com)

RUN apt-get update && apt-get install -y vim cscope ctags git
RUN mkdir ~/vimscript && mkdir -p ~/.vim/bundle && git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

RUN echo "set nocompatible\nfiletype off\nset rtp+=~/.vim/bundle/Vundle.vim\ncall vundle#begin()\nPlugin 'VundleVim/Vundle.vim'" >> /etc/vim/vimrc.local
RUN echo "Plugin 'taglist.vim'\nPlugin 'winmanager'\ncall vundle#end()\nfiletype plugin indent on\n'" >> /etc/vim/vimrc.local

RUN vim +PluginInstall +qall

WORKDIR /myproject

CMD ["/bin/bash"]
