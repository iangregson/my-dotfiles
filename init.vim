" ==============================================================================
" Plugins
" ==============================================================================

" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
call plug#begin('~/.local/share/nvim/plugged')

Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'chriskempson/base16-vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-surround'
Plug 'ryanoasis/vim-devicons'

" Initialize plugin system
call plug#end()

" ==============================================================================
" Airline
" ==============================================================================

let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1

" ==============================================================================
" Colors
" ==============================================================================

" Access colors present in 256 colorspace
let base16colorspace=256

" Base16-shell adds and updates this file with whatever color scheme has been
" most recently selected
if filereadable(expand("~/.vimrc_background"))
  source ~/.vimrc_background
endif

" ==============================================================================
" NERDTree
" ==============================================================================

" Bind ctrl+\ to toggle NERDTree
nnoremap <C-\> :NERDTreeToggle<CR>
nnoremap <M-\> :NERDTreeToggle<CR>
nnoremap <D-\> :NERDTreeToggle<CR>


" ==============================================================================
" System
" ==============================================================================

set mouse=a

" copy current files path to clipboard
nmap cp :let @+= expand("%") <cr>

" Neovim terminal mapping - terminal 'normal mode'
tmap <esc> <c-\><c-n><esc><cr>


set clipboard=unnamed
set pastetoggle=<f6>
set nopaste
autocmd BufWritePre * %s/\s\+$//e
set noshowmode
set noswapfile
filetype on
set number
set numberwidth=1
set tabstop=2 shiftwidth=2 expandtab
set conceallevel=0
set wildmenu
set laststatus=2
set wrap linebreak nolist
set wildmode=full
set autoread
set relativenumber number


" ==============================================================================
" Text navigation
" ==============================================================================

noremap  <silent> <Up>   gk
noremap  <silent> <Down> gj
noremap  <silent> k gk
noremap  <silent> j gj
noremap  <silent> <Home> g<Home>
noremap  <silent> <End>  g<End>
inoremap <silent> <Home> <C-o>g<Home>
inoremap <silent> <End>  <C-o>g<End>
noremap <silent> [H <Home>
noremap <silent> [F <End>
noremap <M-Left> <Home>
noremap <M-Right> <End>
inoremap <c-d> <esc>ddi   "exit insert, dd line, enter insert
noremap H ^
noremap L g_
noremap J 5j
noremap K 5k
noremap <M-Up> 5k
noremap <M-Down> 5j
inoremap <M-Up> <esc>5ki   "exit insert, up 5 lines, back to insert
inoremap <M-Down> <esc>5ji   "exit insert, down 5 lines, back to insert

" ==============================================================================
" Devicons
" ==============================================================================

set guifont=SourceCodePro:h12


" ==============================================================================
" THE END
" ==============================================================================
