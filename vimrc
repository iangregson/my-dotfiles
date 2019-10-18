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
call dein#add('tpope/vim-sleuth')
call dein#add('tpope/vim-commentary')
call dein#add('tpope/vim-repeat')
call dein#add('tpope/vim-vinegar')
call dein#add('vim-airline/vim-airline')
call dein#add('ctrlpvim/ctrlp.vim')
call dein#add('wincent/terminus')
call dein#add('majutsushi/tagbar')
call dein#add('Shougo/vimproc.vim', {'build' : 'make'})

" syntax
call dein#add('sheerun/vim-polyglot')
call dein#add('fatih/vim-go', { 'build': 'GoInstallBinaries' })
call dein#add('rust-lang/rust.vim')
call dein#add('Quramy/tsuquyomi')
call dein#add('zxqfl/tabnine-vim')
call dein#add('w0rp/ale')

" Git
call dein#add('tpope/vim-fugitive')
call dein#add('airblade/vim-gitgutter')
call dein#add('jreybert/vimagit')


" Colours and themes
call dein#add('ryanoasis/vim-devicons')

if dein#check_install()
  call dein#install()
endif
call dein#end()


"""""""""""""""""""""
"      System       "
"""""""""""""""""""""
set nocompatible
set mouse=a
set number
set numberwidth=1
set nowrap
set colorcolumn=120
set background=dark
map ; :
let mapleader=","
inoremap ;; <Esc>

" Visual linewise up and down by default (and use gj gk to go quicker)
noremap <Up> gk
noremap <Down> gj
noremap j gj
noremap k gk
nnoremap J 5j
nnoremap K 5k
nnoremap H 5h
nnoremap L 5l

" Search mappings: These will make it so that going to the next one in a
" search will center on the line it's found in.
nnoremap n nzzzv
nnoremap N Nzzzv


" Enable to copy to clipboard for operations like yank, delete, change and put
" http://stackoverflow.com/questions/20186975/vim-mac-how-to-copy-to-clipboard-without-pbcopy
set clipboard^=unnamed
if has('unnamedplus')
  set clipboard^=unnamed
  set clipboard^=unnamedplus
endif

" This enables us to undo files even if you exit Vim.
if has('persistent_undo')
  set undofile
  set undodir=~/.config/vim/tmp/undo//
endif

" TAG jumping
" create `tags` file first (requires) ctags
command! MakeTags !ctags -R --exclude=.git --exclude=node_modules
" Now jump to that tag using :tag or Ctrl-]

" Yank to the end of the line
nnoremap Y y$

" toggle line numbers
nnoremap <silent> <leader>n :set number! number?<CR>

" auto remove trailing whitespace
autocmd BufWritePre * %s/\s\+$//e

" Enter automatically into the files directory
autocmd BufEnter * silent! lcd %:p:h

"Disable ex mode mapping
map Q <Nop>

"Disable macros
map q <Nop>

" Command auto-complete menu options
set wildmenu
set wildmode=full
set path+=**
set wildignore+=**/node_modules/**

set ttyfast                     " Indicate fast terminal conn for faster redraw
set ttymouse=xterm2             " Indicate terminal type for mouse codes
set encoding=utf-8              " Set default encoding to UTF-8
set autoindent                  " Enable Autoindent
set incsearch                   " Shows the match while typing
set hlsearch                    " Highlight found searches
set noerrorbells                " No beeps
set showcmd                     " Show me what I'm typing
set noswapfile                  " Don't use swapfile
set nobackup                    " Don't create annoying backup files
set splitright                  " Vertical windows should be split to right
set splitbelow                  " Horizontal windows should split to bottom
set autowrite                   " Automatically save before :next, :make etc.
set fileformats=unix,dos,mac    " Prefer Unix over Windows over OS 9 formats
set noshowmode                  " We show the mode with airline or lightline
set ignorecase                  " Search case insensitive...
set smartcase                   " ... but not it begins with upper case
set completeopt=menu,menuone    " Show popup menu, even if there is one entry
set pumheight=10                " Completion window max size

let g:netrw_liststyle=3

"""""""""""""""""""""
"      Plugins      "
"""""""""""""""""""""

" vim-go
let g:go_fmt_command = "goimports"
let g:go_autodetect_gopath = 1
let g:go_list_type = "quickfix"

let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_generate_tags = 1

" Open :GoDeclsDir with ctrl-g
nmap <C-g> :GoDeclsDir<cr>
imap <C-g> <esc>:<C-u>GoDeclsDir<cr>


augroup go
  autocmd!

  " Show by default 4 spaces for a tab
  autocmd BufNewFile,BufRead *.go setlocal noexpandtab tabstop=4 shiftwidth=4

  " :GoBuild and :GoTestCompile
  autocmd FileType go nmap <leader>b :<C-u>call <SID>build_go_files()<CR>

  " :GoTest
  autocmd FileType go nmap <leader>t  <Plug>(go-test)

  " :GoRun
  autocmd FileType go nmap <leader>r  <Plug>(go-run)

  " :GoDoc
  autocmd FileType go nmap <Leader>d <Plug>(go-doc)

  " :GoCoverageToggle
  autocmd FileType go nmap <Leader>c <Plug>(go-coverage-toggle)

  " :GoInfo
  autocmd FileType go nmap <Leader>i <Plug>(go-info)

  " :GoMetaLinter
  autocmd FileType go nmap <Leader>l <Plug>(go-metalinter)

  " :GoDef but opens in a vertical split
  autocmd FileType go nmap <Leader>v <Plug>(go-def-vertical)
  " :GoDef but opens in a horizontal split
  autocmd FileType go nmap <Leader>s <Plug>(go-def-split)

  " :GoAlternate  commands :A, :AV, :AS and :AT
  autocmd Filetype go command! -bang A call go#alternate#Switch(<bang>0, 'edit')
  autocmd Filetype go command! -bang AV call go#alternate#Switch(<bang>0, 'vsplit')
  autocmd Filetype go command! -bang AS call go#alternate#Switch(<bang>0, 'split')
  autocmd Filetype go command! -bang AT call go#alternate#Switch(<bang>0, 'tabe')
augroup END

augroup js
  autocmd!
  " Show by default 2 spaces for a tab
  autocmd BufNewFile,BufRead *.js setlocal expandtab tabstop=2 shiftwidth=2
augroup END

" airline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline_powerline_fonts = 1
let g:airline_left_sep=''
let g:airline_right_sep=''


" delimitMate
let delimitMate_expand_cr = 1

" ctrlp
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_user_command = ['.git/', 'cd %s && git ls-files --exclude-standard -co']

" syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" rust-lang
let g:rustfmt_autosave = 1

" =================

" source ~/.vimrc_background
