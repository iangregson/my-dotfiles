syntax on
set backspace=indent,eol,start
set nocompatible
set noswapfile
set nobackup
set ai
set et
set tabstop=2
set shiftwidth=2
set number
set cindent
set numberwidth=1
set nowrap
set colorcolumn=120
set background=dark
set encoding=utf-8

set clipboard^=unnamed
if has('unnamedplus')
  set clipboard^=unnamed
  set clipboard^=unnamedplus
endif

" auto remove trailing whitespace
autocmd BufWritePre * %s/\s\+$//e

" Enter automatically into the files directory
autocmd BufEnter * silent! lcd %:p:h

"Disable ex mode mapping
map Q <Nop>

"Disable macros
map q <Nop>
