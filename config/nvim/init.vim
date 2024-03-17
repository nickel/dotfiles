let mapleader = ','

let s:editor_root = '~/.config/nvim'
call plug#begin(s:editor_root . '/plugged')

Plug 'rafi/awesome-vim-colorschemes'

Plug 'scrooloose/nerdtree'
  nmap ,n :NERDTreeToggle<CR>
  nmap ,m :NERDTreeClose<CR>:NERDTreeFind<CR>
  nmap ,N :NERDTreeClose<CR>
  nmap ,b :CtrlPBuffer<CR>

Plug 'tpope/vim-commentary'

Plug 'ctrlpvim/ctrlp.vim'
  let g:ctrlp_cmd = 'CtrlPMixed'
  " let g:ctrlp_working_path_mode = 'c'
  let g:ctrlp_custom_ignore = {
    \ 'dir':  '\v[\/](\.git|\.hg|\.svn|node_modules|deps|_build)$',
    \ 'file': '\v\.(exe|so|dll|cache)$',
    \ }

call plug#end()

set nocompatible " be iMproved, required
filetype on
filetype off
filetype plugin indent on

set smartindent
set ts=2          " Tabs are 2 spaces
set bs=2          " Backspace over everything in insert mode
set shiftwidth=2  " Tabs under smart indent
set expandtab
set ruler

set hidden
set backspace=indent,eol,start " allow backspacing over everything in insert mode
set autoindent " always set autoindenting on
set copyindent " copy the previous indentation on autoindenting
set number " always show line numbers
set shiftround " use multiple of shiftwidth when indenting with '<' and '>'
set showmatch " set show matching parenthesis
set ignorecase " ignore case when searching
set smartcase " ignore case if search pattern is all lowercase,
                  " case-sensitive otherwise
set smarttab " insert tabs on the start of a line according to
                  " shiftwidth, not tabstop
set hlsearch " highlight search terms
set incsearch " show search matches as you type

set wrap
set linebreak
set nolist

set history=1000 " remember more commands and search history
set undolevels=1000 " use many muchos levels of undo
set wildignore=*.swp,*.bak,*.pyc,*.class,.DS_Store,.gitignore,.gitkeep,*.png,*.gif,*.jpg
set title " change the terminal's title
set visualbell " don't beep
set noerrorbells " don't beep

set nobackup
set noswapfile

set timeoutlen=1000 ttimeoutlen=0 " eliminate delays on ESC in vim

syntax enable

if &t_Co >= 256 || has("gui_running")
  colorscheme sonokai
  set guifont=Source\ Code\ Pro:h18
  syntax on
endif

" trim trailing whitespace and ensure that the file's line endings are UNIX and not DOS
autocmd BufWritePre * :%s/\s\+$//e

" highlight lines
let &colorcolumn="100,".join(range(120,999),",")
set cursorcolumn
set cursorline
