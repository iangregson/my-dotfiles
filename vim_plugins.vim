" Install Vim Plug if not installed
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall
endif

" Specify a directory for plugins
" - For Neovim: ~/.local/share/vim/plugged
call plug#begin('~/.local/share/vim/plugged')

" General vim good stuff
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-repeat'
Plug 'terryma/vim-multiple-cursors'
Plug 'terryma/vim-expand-region'
Plug 'Yggdroot/indentLine'
Plug 'Raimondi/delimitMate'
Plug 'sheerun/vim-polyglot'
Plug 'vim-airline/vim-airline'
Plug 'christoomey/vim-tmux-navigator'
Plug 'mhinz/vim-sayonara', { 'on': 'Sayonara' }
Plug 'ctrlpvim/ctrlp.vim'
Plug 'ervandew/supertab'

" Git
Plug 'tpope/vim-fugitive'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'airblade/vim-gitgutter'
Plug 'jreybert/vimagit'

" Javascript good stuff
Plug 'valloric/MatchTagAlways'
Plug 'pangloss/vim-javascript'
Plug 'othree/yajs.vim'
Plug 'othree/html5.vim'
Plug 'othree/javascript-libraries-syntax.vim'
Plug 'HerringtonDarkholme/yats.vim'
Plug 'moll/vim-node'
Plug 'mattn/emmet-vim'
Plug 'groenewege/vim-less'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'ternjs/tern_for_vim', { 'do': 'npm install && npm install -g tern' }
Plug 'othree/jspc.vim'
"Typescript Plugins
Plug 'Quramy/tsuquyomi', { 'do': 'npm install -g typescript' }

" Python
Plug 'davidhalter/jedi-vim'

" nerdtree file explorer
Plug 'scrooloose/nerdtree',
Plug 'ryanoasis/vim-devicons'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

" Colours and themes
Plug 'chriskempson/base16-vim'
Plug 'vim-airline/vim-airline-themes'
Plug 'kristijanhusak/vim-hybrid-material'
Plug 'mhartington/oceanic-next'
Plug 'lifepillar/vim-solarized8'
Plug 'joshdick/onedark.vim'

" Initialize plugin system
call plug#end()

