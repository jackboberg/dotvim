set nocompatible    " Use Vim defaults
let mapleader = ","


" --------------------------------------------------------------------
" init pathogen, build help files
runtime bundle/pathogen/autoload/pathogen.vim
call pathogen#infect()
call pathogen#helptags()


" --------------------------------------------------------------------
" Formatting

" tabs -> spaces
set tabstop=4 shiftwidth=4 softtabstop=4 expandtab

" column-width and text wrapping
"set textwidth=72

" better paragraph formatting
set formatprg=par\ -eq
" http://vimdoc.sourceforge.net/htmldoc/change.html#fo-table
":set formatoptions=cqa


" --------------------------------------------------------------------
" Misc

set wildmode=list:longest " make file/command completion useful
set hidden                " multiple buffers
set title                 " term title
set nofoldenable          " code folding is annyoing
set clipboard=unnamed     " OS wide cut/copy 
set t_Co=256              " enable 256 colors 
set showcmd		          " display incomplete commands

" you have a mouse, right?
if has('mouse')
  set mouse=a
endif

" Store temporary files in a central spot
set backupdir=~/.vim_tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set directory=~/.vim_tmp,~/.tmp,~/tmp,/var/tmp,/tmp

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

" Enable file type detection.
filetype plugin indent on


" --------------------------------------------------------------------
" add style

" When the terminal has colors, enable syntax+search highlighting
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif
set incsearch	" do incremental searching

set background=dark
colorscheme solarized

" relative line numbers
function! NumberToggle()
  if(&relativenumber == 1)
    set number
  else
    set relativenumber
  endif
endfunc

nnoremap <leader>l :call NumberToggle()<cr>
set relativenumber 


" --------------------------------------------------------------------
" setup UltiSnips
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
let g:UltiSnipsSnippetDirectories=["UltiSnips", "MyUltiSnips"]


" --------------------------------------------------------------------
" map keys for personal taste
map <leader>w :NERDTreeToggle<CR>
nnoremap <leader><space> :noh<CR>
"Markdown to HTML
nmap <leader>md :%! markdown --html4tags <CR>

" Toggle spell checking on and off with `,s`
nmap <silent> <leader>s :set spell!<CR>
set spelllang=en_us

"let g:syntastic_enable_balloons = 1

" Load .vimrc in split window
map <leader>v :vs $MYVIMRC<CR><C-W>_

" Reselect visual block after indent/outdent
"vnoremap < <gv
"vnoremap > >gv

" Easy split navigation
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l

inoremap <S-S> <esc>
" select all
map <Leader>a ggVG

" --------------------------------------------------------------------
" buffer keys

" Switch back to last file in buffer
nmap <leader><leader> :b#<cr>
" use arrow keys to cycle thru buffer
noremap <left> :bp<CR>
noremap <right> :bn<CR>

" --------------------------------------------------------------------
" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 72 characters.
  autocmd FileType text setlocal textwidth=72

  " When editing a file, always jump to the last known cursor position.
  autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif

  " Syntax of these languages is fussy over tabs Vs spaces
  autocmd FileType make setlocal ts=8 sts=8 sw=8 noexpandtab
  autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
   
  " Customisations based on house-style (arbitrary)
  "autocmd FileType python setlocal ts=2 sts=2 sw=2 expandtab
  autocmd FileType html setlocal ts=2 sts=2 sw=2 expandtab
  autocmd FileType css setlocal ts=2 sts=2 sw=2 expandtab
  autocmd FileType javascript setlocal ts=2 sts=2 sw=2 expandtab
   
  " Treat .rss files as XML
  autocmd BufNewFile,BufRead *.rss setfiletype xml

  " Show Git diff in window split when commiting
  autocmd FileType gitcommit DiffGitCached

  " re-source .vimrc when saved
  autocmd BufWritePost .vimrc so ~/.vimrc

  autocmd BufEnter * setlocal cursorline
  autocmd BufEnter * setlocal colorcolumn=73
  autocmd BufLeave * setlocal nocursorline
  autocmd BufLeave * setlocal colorcolumn=0

  augroup END
else

  " always set autoindenting on
  set autoindent

endif " has("autocmd")

