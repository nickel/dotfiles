let mapleader = ','

let s:editor_root = '~/.config/nvim'
call plug#begin(s:editor_root . '/plugged')

Plug 'scrooloose/nerdtree'
  nmap ,n :NERDTreeToggle<CR>
  nmap ,m :NERDTreeClose<CR>:NERDTreeFind<CR>
  nmap ,N :NERDTreeClose<CR>
  nmap ,b :CtrlPBuffer<CR>

Plug 'tpope/vim-commentary'

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
