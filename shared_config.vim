" ==============================================================================
" System
" ==============================================================================

set mouse=a

" copy current files path to clipboard
nmap cp :let @+= expand("%") <cr>

" Neovim terminal mapping - terminal 'normal mode'
tmap <esc> <c-\><c-n><esc><cr>

" file type recognition
filetype on
filetype plugin on
filetype indent on

" syntax highlighting
syntax on

set clipboard=unnamed
set pastetoggle=<f6>
set nopaste
autocmd BufWritePre * %s/\s\+$//e
set noshowmode
filetype on
set number
set numberwidth=1
set conceallevel=0
set wildmenu
set lazyredraw
set laststatus=2
set nowrap linebreak nolist
set wildmode=full
set autoread
set autoindent
set relativenumber number
nnoremap ; :

" Map the leader key to comma
let mapleader=","

" open new split panes to right and below (as you probably expect)
set splitright
set splitbelow

" use ;; for escape
" http://vim.wikia.com/wiki/Avoid_the_escape_key
inoremap ;; <Esc>

" toggle tagbar
nnoremap <silent> <leader>tb :TagbarToggle<CR>

" toggle line numbers
nnoremap <silent> <leader>n :set number! number?<CR>

" reload config
nnoremap <leader>r :source ~/.vimrc<CR>

" ==============================================================================
" Turn off swap files
" ==============================================================================

set noswapfile
set nobackup
set nowb

" ==============================================================================
" Persistent Undo
" ==============================================================================

" Keep undo history across sessions, by storing in file.
silent !mkdir ~/.config/nvim/backups > /dev/null 2>&1
set undodir=~/.config/nvim/backups
set undofile

" ==============================================================================
" Indentation
" ==============================================================================

set shiftwidth=2
set softtabstop=2
set tabstop=2
set expandtab
set smartindent
set colorcolumn=140

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
nnoremap <silent> <C-L> :nohlsearch<CR><C-L>
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

" Resize window with shift + and shift -
nnoremap + <c-w>5>
nnoremap _ <c-w>5<

" Center highlighted search
nnoremap n nzz
nnoremap N Nzz

" save with alt s
map <M-s> <esc>:w<CR>
imap <M-s> <esc>:w<CR>

" pane navigation
nnoremap <leader>l <C-w>l
nnoremap <leader>k <C-w>k
nnoremap <leader>j <C-w>j
nnoremap <leader>h <C-w>h
nnoremap <leader>t <C-w>T

" Open vertical split
nnoremap <Leader>v <C-w>v

"Disable ex mode mapping
map Q <Nop>

" Generate tags
nnoremap <Leader>gt :sp term://ctags -R --exclude=node_modules .<CR>G

" Jump to definition in vertical split
nnoremap <Leader>] <C-W>v<C-]>


" ==============================================================================
" tmux navigation
" ==============================================================================

let g:tmux_navigator_no_mappings = 1

nnoremap <silent> <C-Left> :TmuxNavigateLeft<cr>
nnoremap <silent> <C-Down> :TmuxNavigateDown<cr>
nnoremap <silent> <C-Up> :TmuxNavigateUp<cr>
nnoremap <silent> <C-Right> :TmuxNavigateRight<cr>


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
inoremap <c-d> <esc>ddi
noremap H ^
noremap L g_
noremap J 5j
noremap K 5k
noremap <M-Up> 5k
noremap <M-Down> 5j
inoremap <M-Up> <esc>5ki
inoremap <M-Down> <esc>5ji
inoremap <M-Left> <Home>
inoremap <M-Right> <End>

"Move text up and down lines with Ctrl + Up or Down
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

"auto indent on enter
let g:delimitMate_expand_cr = 1

let g:user_emmet_expandabbr_key = '<c-e>'                                       "Change trigger emmet key
let g:user_emmet_next_key = '<c-n>'                                             "Change trigger jump to next for emmet

" ==============================================================================
" NERDTree
" ==============================================================================

" Bind ctrl+\ to toggle NERDTree
nnoremap <C-\> :NERDTreeToggle<CR>
nnoremap <M-\> :NERDTreeToggle<CR>
nnoremap <D-\> :NERDTreeToggle<CR>

let NERDTreeShowHidden=1

if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | wincmd p | endif

" Auto start NERD tree if no files are specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | exe 'NERDTree' | endif

" Let quit work as expected if after entering :q the only window left open is NERD Tree itself
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Find current file in NERDTree
nnoremap <Leader>hf :NERDTreeFind<CR>

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
" Devicons
" ==============================================================================

set encoding=utf8
set guifont=Monoid\ Nerd\ Font:h11

" whether or not to show the nerdtree brackets around flags
let g:webdevicons_conceal_nerdtree_brackets = 1
" the amount of space to use after the glyph character (default ' ')
let g:WebDevIconsNerdTreeAfterGlyphPadding = '  '
" Force extra padding in NERDTree so that the filetype icons line up vertically
let g:WebDevIconsNerdTreeGitPluginForceVAlign = 1
" enable folder/directory glyph flag (disabled by default with 0)
let g:WebDevIconsUnicodeDecorateFolderNodes = 1
" enable open and close folder/directory glyph flags (disabled by default with 0)
let g:DevIconsEnableFoldersOpenClose = 1

" after a re-source, fix syntax matching issues (concealing brackets):
if exists('g:loaded_webdevicons')
    call webdevicons#refresh()
endif

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

"python with virtualenv support
py << EOF
import os
import sys
if 'VIRTUAL_ENV' in os.environ:
  project_base_dir = os.environ['VIRTUAL_ENV']
  activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
  execfile(activate_this, dict(__file__=activate_this))
EOF

let g:ycm_autoclose_preview_window_after_completion=1
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>

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
" Airline
" ==============================================================================

let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline_theme = 'laederon'

set hidden

let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#tabline#buffer_idx_mode = 1
let g:airline#extensions#neomake#error_symbol='• '
let g:airline#extensions#neomake#warning_symbol='•  '
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


" ==============================================================================
" Colors and fonts
" ==============================================================================

set termguicolors
" Access colors present in 256 colorspace
" let base16colorspace=256

" Base16-shell adds and updates this file with whatever color scheme has been
" most recently selected
" if filereadable(expand("~/.vimrc_background"))
"   source ~/.vimrc_background
" endif

" Doing this to fix the issue where colors are different in tmux

let g:enable_bold_font = 1                                                      "Enable bold font in colorscheme
let g:enable_italic_font = 1                                                    "Enable italic font in colorscheme

"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
"If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
if (empty($TMUX))
  if (has("nvim"))
    "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
  "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
  " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
  if (has("termguicolors"))
    set termguicolors
  endif
endif

" set background=dark
" silent! colorscheme hybrid_material
" silent! colorscheme OceanicNext
" silent! colorscheme solarized8_dark_high
silent! colorscheme onedark
let g:airline_theme='onedark'


" ==============================================================================
" THE END
" ==============================================================================