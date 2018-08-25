FROM ubuntu
MAINTAINER gggzs (njuptgggzs@163.com)

RUN apt-get update && apt-get install -y vim cscope ctags git
RUN echo "set cursorline" >> /etc/vim/vimrc.local && echo "set tabstop=4" >> /etc/vim/vimrc.local && echo "set softtabstop=4" >> /etc/vim/vimrc.local && echo "set shiftwidth=4" >> /etc/vim/vimrc.local && echo "set expandtab" >> /etc/vim/vimrc.local && echo "set nobackup" >> /etc/vim/vimrc.local && echo "set noundofile" >> /etc/vim/vimrc.local && echo "set fdm=syntax" >> /etc/vim/vimrc.local && echo "filetype plugin indent on" >> /etc/vim/vimrc.local
RUN mkdir ~/vimscript/ && mkdir ~/.vim
RUN cd ~/vimscript && git clone https://github.com/vim-scripts/taglist.vim.git
RUN mv ~/vimscript/taglist.vim/* ~/.vim/

WORKDIR /myproject

CMD ["/bin/bash"]
