FROM ubuntu
MAINTAINER gggzs (njuptgggzs@163.com)

RUN apt-get update && apt-get install -y vim cscope ctags git
RUN echo "set cursorline" >> /etc/vim/vimrc.local && echo "set tabstop=4" >> /etc/vim/vimrc.local && echo "set softtabstop=4" >> /etc/vim/vimrc.local && echo "set shiftwidth=4" >> /etc/vim/vimrc.local && echo "set expandtab" >> /etc/vim/vimrc.local && echo "set nobackup" >> /etc/vim/vimrc.local && echo "set noundofile" >> /etc/vim/vimrc.local && echo "set fdm=syntax" >> /etc/vim/vimrc.local && echo "filetype plugin indent on" >> /etc/vim/vimrc.local && echo "set fileformats=unix" >> /etc/vim/vimrc.local
RUN mkdir ~/vimscript/ && mkdir ~/.vim
RUN cd ~/vimscript && git clone https://github.com/vim-scripts/taglist.vim.git
RUN mv ~/vimscript/taglist.vim/* ~/.vim/
RUN echo "set tags=~/vimscript/ctags;tags;" >> /etc/vim/vimrc.local && echo "set autochdir" >> /etc/vim/vimrc.local && echo "function! UpdateTagsFile()\n\tsilent !ctags -R --languages=c++ --langmap=c++:+.c --c++-kinds=+px --fields=+aiKSz --extra=+q -f ~/vimscript/ctags /myproject\nendfunction\nnmap <F6> :call UpdateTagsFile()<CR>" >> /etc/vim/vimrc.local && echo "function! DeleteTagsFile()\n\tsilent !rm ~/vimscript/ctags\nendfunction\nnmap <C-F6> :call DeleteTagsFile()<CR>" >> /etc/vim/vimrc.local && echo "let Tlist_Auto_Open=1" >> /etc/vim/vimrc.local && echo "let Tlist_File_Fold_Auto_Close=1" >> /etc/vim/vimrc.local && echo "let Tlist_Exit_OnlyWindow=1" >> /etc/vim/vimrc.local && echo "nnoremap <silent> <F7> :TlistToggle<CR>" >> /etc/vim/vimrc.local && echo "function! UpdateCscopeFile()\n\tcs kill cscope.out\n\tsilent !rm ~/vimscript/cscope.out\n\tsilent !find /myproject/* -type f > cscope.files &  cscope -Rbk -i cscope.files\n\tcs add ~/vimscript/cscope.out\nendfunction\nnmap <F12> :call UpdateCscopeFile()<CR>\ncs a ~/vimscript/cscope.out" >> /etc/vim/vimrc.local

RUN cd ~/vimscript && git clone https://github.com/vim-scripts/The-NERD-tree.git && cp -frp ~/vimscript/The-NERD-tree/* ~/.vim/ && rm -rf ~/vimscript/The-NERD-tree/*
RUN echo "nmap <F8> :NERDTreeToggle<CR>\nlet g:NERDTreeDirArrows=1\nlet g:NERDTreeWinPos='right'\nlet g:NERDTreeDirArrowExpandable='>'\nlet g:NERDTreeDirArrowCollapsible='v'" >> /etc/vim/vimrc.local

WORKDIR /myproject

CMD ["/bin/bash"]
