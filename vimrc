set nocompatible    " Use Vim defaults

" init pathogen, build help files
runtime bundle/pathogen/autoload/pathogen.vim
call pathogen#infect()
call pathogen#helptags()

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
set incsearch	" do incremental searching

" you have a mouse, right?
if has('mouse')
  set mouse=a
endif

" tabs -> spaces
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4

set wildmode=list:longest
set title   "term title
set hidden

set backupdir=~/.vim_tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set directory=~/.vim_tmp,~/.tmp,~/tmp,/var/tmp,/tmp

set t_Co=256
set nu  " line numbers
set clipboard=unnamed
set nofoldenable
" allow backspacing over everything in insert mode
set backspace=indent,eol,start

" add style
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif
set background=dark
colorscheme solarized

" setup UltiSnips
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
let g:UltiSnipsSnippetDirectories=["UltiSnips", "MyUltiSnips"]

" map keys for personal taste
let mapleader = ","
map <leader>w :NERDTreeToggle<CR>
nnoremap <leader><space> :noh<CR>
"Markdown to HTML
nmap <leader>md :%! markdown --html4tags <CR>  
