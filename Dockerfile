FROM ubuntu:24.04
MAINTAINER gggzs (njuptgggzs@163.com)

RUN apt-get update && apt-get install -y vim cscope ctags git build-essential cmake python-dev python3-dev
RUN mkdir ~/vimscript && mkdir -p ~/.vim/bundle && git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

RUN echo "set nocompatible\nfiletype off\nset rtp+=~/.vim/bundle/Vundle.vim\ncall vundle#begin()\nPlugin 'VundleVim/Vundle.vim'" >> /etc/vim/vimrc.local
RUN echo "Plugin 'Valloric/YouCompleteMe'\nPlugin 'taglist.vim'\nPlugin 'winmanager'\ncall vundle#end()\nfiletype plugin indent on\n'" >> /etc/vim/vimrc.local

RUN echo "set cursorline\nset tabstop=4\nset softtabstop=4\nset shiftwidth=4\nset expandtab\nset nobackup\nset noundofile\nset fdm=syntax\nset fileformats=unix\nset encoding=utf-8" >> /etc/vim/vimrc.local

RUN vim +PluginInstall +qall

RUN echo "let Tlist_File_Fold_Auto_Close=1\nset autochdir" >> /etc/vim/vimrc.local
RUN echo "let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/.ycm_extra_conf.py'" >> /etc/vim/vimrc.local
RUN echo "def Settings( **kwargs ):\n\treturn {\n\t'flags': [ '-x', 'c++', '-Wall', '-Wextra', '-Werror' ],\n\t}">> ~/.vim/bundle/YouCompleteMe/.ycm_extra_conf.py
RUN echo "let g:winManagerWindowLayout = \"TagList|FileExplorer,BufExplorer\"\nnmap <silent> <F9> :WMToggle<cr>" >> /etc/vim/vimrc.local
RUN echo "let g:ycm_semantic_triggers =  {'c' : ['->', '.','re!\w{2}'],'cpp,objcpp' : ['->', '.', '::'],}" >> /etc/vim/vimrc.local

RUN cd ~/.vim/bundle/YouCompleteMe && ./install.py --clang-completer

WORKDIR /myproject

CMD ["/bin/bash"]
