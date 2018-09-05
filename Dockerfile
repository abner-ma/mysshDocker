FROM ubuntu
MAINTAINER gggzs (njuptgggzs@163.com)

RUN apt-get update && apt-get install -y vim cscope ctags git
RUN mkdir ~/vimscript && mkdir -p ~/.vim/bundle && git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

RUN echo "set nocompatible\nfiletype off\nset rtp+=~/.vim/bundle/Vundle.vim\ncall vundle#begin()\nPlugin 'VundleVim/Vundle.vim'" >> /etc/vim/vimrc.local
RUN echo "Plugin 'taglist.vim'\nPlugin 'winmanager'\ncall vundle#end()\nfiletype plugin indent on\n'" >> /etc/vim/vimrc.local

RUN echo "set cursorline\nset tabstop=4\nset softtabstop=4\nset shiftwidth=4\nset expandtab\nset nobackup\nset noundofile\nset fdm=syntax\nset fileformats=unix" >> /etc/vim/vimrc.local

RUN vim +PluginInstall +qall

RUN echo "let Tlist_File_Fold_Auto_Close=1\nset tags=~/vimscript/ctags;tags;\nset autochdir" >> /etc/vim/vimrc.local
RUN echo "let g:winManagerWindowLayout = \"TagList|FileExplorer,BufExplorer\"\nnmap <silent> <F9> :WMToggle<cr>" >> /etc/vim/vimrc.local

RUN echo "function! UpdateTagsFile()\n\tsilent !ctags -R --languages=c++ --langmap=c++:+.c --c++-kinds=+px --fields=+aiKSz --extra=+q -f ~/vimscript/ctags /myproject\nendfunction\nnmap <F6> :call UpdateTagsFile()<CR>" >> /etc/vim/vimrc.local && echo "function! DeleteTagsFile()\n\tsilent !rm ~/vimscript/ctags\nendfunction\nnmap <C-F6> :call DeleteTagsFile()<CR>" >> /etc/vim/vimrc.local && echo "function! UpdateCscopeFile()\n\tcs kill cscope.out\n\tsilent !rm ~/vimscript/cscope.out\n\tsilent !find /myproject/* -type f > ~/vimscript/cscope.files && cd ~/vimscript && cscope -Rbk -i cscope.files\n\tcs add ~/vimscript/cscope.out\nendfunction\nnmap <F12> :call UpdateCscopeFile()<CR>\ncs add ~/vimscript/cscope.out" >> /etc/vim/vimrc.local

RUN echo "nmap <C-\>s :cs find s <C-R>=expand(\"<cword>\")<cr><cr>\nnmap <C-\>g :cs find g <C-R>=expand(\"<cword>\")<cr><cr>\nnmap <C-\>c :cs find c <C-R>=expand(\"<cword>\")<cr><cr>\nnmap <C-\>t :cs find t <C-R>=expand(\"<cword>\")<cr><cr>\nnmap <C-\>e :cs find e <C-R>=expand(\"<cword>\")<cr><cr>\nnmap <C-\>f :cs find f <C-R>=expand(\"<cfile>\")<cr><cr>\nnmap <C-\>i :cs find i <C-R>=expand(\"<cfile>\")<cr><cr>\nnmap <C-\>d :cs find d <C-R>=expand(\"<cword>\")<cr><cr>" >> /etc/vim/vimrc.local

WORKDIR /myproject

CMD ["/bin/bash"]
