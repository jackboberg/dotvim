" Use Vim settings, rather than Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" initialize pathogen
runtime bundle/pathogen/autoload/pathogen.vim
call pathogen#infect()

" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Enable file type detection.
  filetype plugin indent on

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78

  " When editing a file, always jump to the last known cursor position.
  autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif

  augroup END

else

  set autoindent		" always set autoindenting on

endif " has("autocmd")

set showcmd		" display incomplete commands
set incsearch		" do incremental searching

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  set mouse=a
endif

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif

set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4

let mapleader = ","
set wildmode=list:longest
set title
set hidden

set backupdir=~/.vim_tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set directory=~/.vim_tmp,~/.tmp,~/tmp,/var/tmp,/tmp

map <leader>w :NERDTreeToggle<CR>

set t_Co=256
set nu
set clipboard=unnamed
set nofoldenable

colorscheme solarized
