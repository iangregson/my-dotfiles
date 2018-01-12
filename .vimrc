" ====================================
" Plugins
" ====================================

" Setup dein for plugin management. If it's not installed, install it.

if (!isdirectory(expand('$HOME/.vim/repos/github.com/Shougo/dein.vim')))
  call system(expand('mkdir -p $HOME/.vim/repos/github.com'))
  call system(expand('git clone https://github.com/Shougo/dein.vim $HOME/.vim/repos/github.com/Shougo/dein.vim'))
endif


set nocompatible
set runtimepath+=~/.vim/repos/github.com/Shougo/dein.vim/

call dein#begin(expand('~/.vim'))
call dein#add('Shougo/dein.vim')

" General vim good stuff
call dein#add('tpope/vim-sensible')
call dein#add('tpope/vim-unimpaired')
call dein#add('tpope/vim-surround')
call dein#add('tpope/vim-commentary')
call dein#add('tpope/vim-repeat')
call dein#add('Raimondi/delimitMate')
call dein#add('tpope/vim-vinegar')
call dein#add('terryma/vim-multiple-cursors')
call dein#add('terryma/vim-expand-region')
call dein#add('Yggdroot/indentLine')
call dein#add('vim-airline/vim-airline')
call dein#add('mhinz/vim-sayonara', { 'on': 'Sayonara' })
call dein#add('ctrlpvim/ctrlp.vim')
call dein#add('easymotion/vim-easymotion')
call dein#add('wincent/terminus')
call dein#add('ervandew/supertab')

" syntax
call dein#add('sheerun/vim-polyglot')
call dein#add('fatih/vim-go')

" Git
call dein#add('tpope/vim-fugitive')
call dein#add('airblade/vim-gitgutter')
call dein#add('jreybert/vimagit')


" Colours and themes
call dein#add('ryanoasis/vim-devicons')
call dein#add('chriskempson/base16-vim')
call dein#add('vim-airline/vim-airline-themes')
call dein#add('kristijanhusak/vim-hybrid-material')
call dein#add('mhartington/oceanic-next')
call dein#add('lifepillar/vim-solarized8')
call dein#add('joshdick/onedark.vim')
call dein#add('dracula/vim')

if dein#check_install()
  call dein#install()
endif
call dein#end()


" ====================================
" System settings
" ====================================

set mouse=a
set nowrap linebreak nolist
set conceallevel=0
set lazyredraw
set laststatus=2
set backspace=2
set background=dark

" Use OSX clipboard and don't auto indent on paste
set clipboard=unnamed
set nopaste

" Line numbering
set number
set numberwidth=1
set relativenumber number

" Command auto-complete menu options
set wildmenu
set wildmode=full

" Map the leader key to comma
let mapleader=","

" Shortcut to :
nnoremap ; :

" open new split panes to right and below (as you probably expect)
set splitright
set splitbelow

" use ;; for escape
inoremap ;; <Esc>

" toggle tagbar
nnoremap <silent> <leader>tb :TagbarToggle<CR>

" toggle line numbers
nnoremap <silent> <leader>n :set number! number?<CR>

" reload config
nnoremap <leader>r :source ~/.vimrc<CR>

" Turn off swap files
set noswapfile
set nobackup
set nowb

" Tell vim not to show the mode, airline will do it for us
" set noshowmode

" auto remove trailing whitespace
autocmd BufWritePre * %s/\s\+$//e

" copy current files path to clipboard
nmap cp :let @+= expand("%") <cr>

" Keep undo history across sessions, by storing in file.
silent !mkdir ~/.vim/backup > /dev/null 2>&1
set undodir=~/.vim/backups
set undofile

" Indentation
set shiftwidth=2
set softtabstop=2
set tabstop=2
set expandtab
set smartindent
set colorcolumn=140

" Open vertical split
nnoremap <Leader>v <C-w>v

"Disable ex mode mapping
map Q <Nop>

"Disable macros
map q <Nop>

" save with ,s
map <leader>s <esc>:w<CR>
inoremap <leader>s <esc>:w<CR>
nnoremap <leader>s :w<CR>

" Resize window with shift + and shift -
nnoremap + <c-w>5>
nnoremap _ <c-w>5<

let delimitMate_expand_cr = 1

" Auto-complete on leader c
set completeopt=longest,menuone
nnoremap <leader>c <C-x><C-o>
inoremap <leader>c <C-x><C-o>


" ====================================
" Working with text
" ====================================

" Basics
noremap  <silent> <Up>   gk
noremap  <silent> <Down> gj
noremap  <silent> k gk
noremap  <silent> j gj
noremap  <silent> <Home> g<Home>
noremap  <silent> <End>  g<End>
inoremap <silent> <Home> <C-o>g<Home>
inoremap <silent> <End>  <C-o>g<End>
noremap [[ <Home>
noremap ]] <End>
noremap <M-Left> <Home>
noremap <M-Right> <End>
noremap H ^
noremap L g_
noremap J 5j
noremap K 5k
noremap <M-Up> 5k
noremap <M-Down> 5j
inoremap <M-Up> <esc>5ki
inoremap <M-Down> <esc>5ji
nnoremap <S-Up> 5k
nnoremap <S-Down> 5j
inoremap <S-Up> 5k
inoremap <S-Down> 5j
inoremap <M-Left> <Home>
inoremap <M-Right> <End>

" Delete line
inoremap <c-d> <esc>ddi

" Move text up and down lines with Ctrl + Up or Down
nnoremap <C-Down> :m .+1<CR>==
nnoremap <C-Up> :m .-2<CR>==
inoremap <C-Down> <Esc>:m .+1<CR>==gi
inoremap <C-Up> <Esc>:m .-2<CR>==gi
vnoremap <C-Down> :m '>+1<CR>gv=gv
vnoremap <C-Up> :m '<-2<CR>gv=gv

" Don't put changes in the register
nnoremap c "_c
nnoremap d "_d
nnoremap x "_x

" Move to the end of yanked text after yank and paste
nnoremap p p`]
vnoremap y y`]
vnoremap p p`]

" Yank to the end of the line
nnoremap Y y$


" ==============================================================================
" Working with buffers
" ==============================================================================

" close buffer
nnoremap <silent> <leader>x :Sayonara!<CR>

" kill buffer
nnoremap <silent> <leader>k :Sayonara<CR>

" list and select buffer
nnoremap <silent> <leader>bl :ls<CR>:buffer<Space>

" horizontal split with new buffer
nnoremap <silent> <leader>bh :new<CR>

" vertical split with new buffer
nnoremap <silent> <leader>bv :vnew<CR>

" redraw screan and clear search highlighted items
"http://stackoverflow.com/questions/657447/vim-clear-last-search-highlighting#answer-25569434
nnoremap <silent> <CR> :nohlsearch<CR>

" Clear search highlight
nnoremap <Leader><space> :noh<CR>

" Toggle between last 2 buffers
nnoremap <leader><tab> <c-^>

" Toggle buffer list
nnoremap <Leader>b :CtrlPBuffer<CR>
nnoremap <Leader>t :CtrlPBufTag<CR>
nnoremap <Leader>m :CtrlPMRU<CR>

" Maps for indentation in normal mode
nnoremap <tab> >>
nnoremap <s-tab> <<

" Indenting in visual mode
xnoremap <s-tab> <gv
xnoremap <tab> >gv

" Center highlighted search
nnoremap n nzz
nnoremap N Nzz

" pane navigation
nnoremap <leader>l <C-w>l
nnoremap <leader>k <C-w>k
nnoremap <leader>j <C-w>j
nnoremap <leader>h <C-w>h
nnoremap <leader>t <C-w>T


" ==============================================================================
" vim-indent-guides
" ==============================================================================

let g:indent_guides_enable_on_vim_startup = 1
hi IndentGuidesOdd ctermbg=234
hi IndentGuidesEvent ctermbg=235


" ==============================================================================
" fugitive
" ==============================================================================

nmap <Leader>gs :Gstatus<CR>
nmap <Leader>ga :Gwrite<CR>
nmap <Leader>gc :Gcommit<CR>
nmap <Leader>gp :Gpush<CR>


" ==============================================================================
" Folding
" ==============================================================================

" Space to toggle folds.
set foldmethod=syntax
set foldlevel=99
nnoremap <Space> za
vnoremap <Space> za
autocmd FileType vim setlocal foldmethod=marker
autocmd FileType vim setlocal foldlevel=99

autocmd FileType css,scss,json setlocal foldmethod=marker
autocmd FileType css,scss,json setlocal foldmarker={,}

let g:xml_syntax_folding = 1
autocmd FileType xml setl foldmethod=syntax

autocmd FileType html setl foldmethod=expr
autocmd FileType html setl foldexpr=HTMLFolds()

autocmd FileType javascript,typescript,json setl foldmethod=syntax
autocmd FileType python setl foldmethod=syntax


" ==============================================================================
" Ctrl-P
" ==============================================================================

let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_user_command = ['.git/', 'cd %s && git ls-files --exclude-standard -co']

" ==============================================================================
" Python
" ==============================================================================

let python_highlight_all=1

" Proper indentation for python if we're in a .py
au BufNewFile,BufRead *.py
    \ set tabstop=4
    \ set softtabstop=4
    \ set shiftwidth=4
    \ set textwidth=79
    \ set expandtab
    \ set autoindent
    \ set fileformat=unix


" ==============================================================================
" Easy motion
" ==============================================================================

let g:EasyMotion_do_mapping = 0 " Disable default mappings

" Jump to anywhere you want with minimal keystrokes, with just one key binding.
" `s{char}{label}`
nmap s <Plug>(easymotion-overwin-f)
" or
" `s{char}{char}{label}`
" Need one more keystroke, but on average, it may be more comfortable.
nmap s <Plug>(easymotion-overwin-f2)

" Turn on case insensitive feature
let g:EasyMotion_smartcase = 1

" JK motions: Line motions
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)


" ==============================================================================
" Airline
" ==============================================================================

let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline_theme = 'tomorrow'

set hidden

let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#tabline#buffer_idx_mode = 1
cnoreabbrev <silent> <expr> x getcmdtype() == ":" && getcmdline() == 'x' ? 'Sayonara' : 'x'
tmap <leader>x <c-\><c-n>:bp! <BAR> bd! #<CR>
nmap <leader>, :bnext<CR>
tmap <leader>, <C-\><C-n>:bnext<cr>
nmap <leader>. :bprevious<CR>
tmap <leader>. <C-\><C-n>:bprevious<CR>
tmap <leader>1  <C-\><C-n><Plug>AirlineSelectTab1
tmap <leader>2  <C-\><C-n><Plug>AirlineSelectTab2
tmap <leader>3  <C-\><C-n><Plug>AirlineSelectTab3
tmap <leader>4  <C-\><C-n><Plug>AirlineSelectTab4
tmap <leader>5  <C-\><C-n><Plug>AirlineSelectTab5
tmap <leader>6  <C-\><C-n><Plug>AirlineSelectTab6
tmap <leader>7  <C-\><C-n><Plug>AirlineSelectTab7
tmap <leader>8  <C-\><C-n><Plug>AirlineSelectTab8
tmap <leader>9  <C-\><C-n><Plug>AirlineSelectTab9
nmap <leader>1 <Plug>AirlineSelectTab1
nmap <leader>2 <Plug>AirlineSelectTab2
nmap <leader>3 <Plug>AirlineSelectTab3
nmap <leader>4 <Plug>AirlineSelectTab4
nmap <leader>5 <Plug>AirlineSelectTab5
nmap <leader>6 <Plug>AirlineSelectTab6
nmap <leader>7 <Plug>AirlineSelectTab7
nmap <leader>8 <Plug>AirlineSelectTab8
nmap <leader>9 <Plug>AirlineSelectTab9
let g:airline#extensions#tabline#buffer_idx_format = {
      \ '0': '0 ',
      \ '1': '1 ',
      \ '2': '2 ',
      \ '3': '3 ',
      \ '4': '4 ',
      \ '5': '5 ',
      \ '6': '6 ',
      \ '7': '7 ',
      \ '8': '8 ',
      \ '9': '9 ',
      \}


" ======================================
" THE END
" ======================================
