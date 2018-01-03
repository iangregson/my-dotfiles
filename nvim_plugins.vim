" Install Vim Plug if not installed
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall
endif

" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
call plug#begin('~/.local/share/nvim/plugged')

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
Plug 'vim-airline/vim-airline'
Plug 'christoomey/vim-tmux-navigator'
Plug 'mhinz/vim-sayonara', { 'on': 'Sayonara' }
Plug 'ctrlpvim/ctrlp.vim'
Plug 'Shougo/neosnippet.vim'
Plug 'Shougo/neosnippet-snippets'
Plug 'ervandew/supertab'

" Git
Plug 'tpope/vim-fugitive'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'airblade/vim-gitgutter'
Plug 'jreybert/vimagit'

" Javascript good stuff
Plug 'valloric/MatchTagAlways'
Plug 'neomake/neomake'
Plug 'pangloss/vim-javascript'
Plug 'othree/yajs.vim'
Plug 'othree/html5.vim'
Plug 'othree/javascript-libraries-syntax.vim'
Plug 'HerringtonDarkholme/yats.vim'
Plug 'moll/vim-node'
Plug 'mattn/emmet-vim'
Plug 'groenewege/vim-less'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'ternjs/tern_for_vim', { 'do': 'npm install && npm install -g tern' }
Plug 'carlitux/deoplete-ternjs'
Plug 'othree/jspc.vim'
"Typescript Plugins
Plug 'Shougo/vimproc.vim', { 'do': 'make' }
Plug 'Quramy/tsuquyomi', { 'do': 'npm install -g typescript' }
Plug 'mhartington/deoplete-typescript'

" Python
Plug 'davidhalter/jedi-vim'
Plug 'zchee/deoplete-jedi'

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
Plug 'dracula/vim'

" Initialize plugin system
call plug#end()


" ==============================================================================
" Deoplete
" ==============================================================================

let g:used_javascript_libs = 'lodash,angularjs,jasmine,chai'

let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_ignore_case = 1
let g:deoplete#enable_smart_case = 1
let g:deoplete#enable_camel_case = 1
let g:deoplete#enable_refresh_always = 1
let g:deoplete#max_abbr_width = 0
let g:deoplete#max_menu_width = 0
let g:deoplete#omni#input_patterns = get(g:,'deoplete#omni#input_patterns',{})
call deoplete#custom#set('_', 'matchers', ['matcher_full_fuzzy'])

let g:tern_request_timeout = 1
let g:tern_request_timeout = 6000
let g:tern#command = ["tern"]
let g:tern#arguments = ["--persistent"]
let g:deoplete#sources#tss#javascript_support = 1
let g:tsuquyomi_javascript_support = 1
let g:tsuquyomi_auto_open = 1
let g:tsuquyomi_disable_quickfix = 1

autocmd FileType javascript,javascript.jsx nnoremap <silent><buffer> gd :<C-U>TernDef<CR>
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS

set completeopt=longest,menuone,preview

let g:deoplete#sources = {}
let g:deoplete#sources['javascript.jsx'] = ['file', 'ultisnips', 'ternjs']

autocmd FileType javascript let g:SuperTabDefaultCompletionType = "<c-x><c-o>"
let g:UltiSnipsExpandTrigger="<C-j>"
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"

function! Multiple_cursors_before()
  let b:deoplete_disable_auto_complete=2
endfunction
function! Multiple_cursors_after()
  let b:deoplete_disable_auto_complete=0
endfunction

call deoplete#custom#set('buffer', 'mark', 'ℬ')
call deoplete#custom#set('ternjs', 'mark', '')
call deoplete#custom#set('omni', 'mark', '⌾')
call deoplete#custom#set('file', 'mark', 'file')
call deoplete#custom#set('jedi', 'mark', '')
call deoplete#custom#set('neosnippet', 'mark', '')
