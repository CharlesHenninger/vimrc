" <in vim> :source .vimrc
" <in vim> :PlugInstall
" 
" <in bashrc> export PS1='\e[0;32m[\t]\e[0m \e[0;35m\u:\w\e[0m \e[0;33m\$->\e[0m '
" <in bashrc> alias ls='ls -aGH'
"
" F1 : Nerdtree (file tree)
" F2 : Undotree (change log and state saver)
" F3 : Tag manager
"
" Ctrl-w twice to switch focus
"
" <iterm2> cmd-d : open session to right
" <iterm2> cmd-shift-d : open session below
" <iterm2> cmd-opt-arrow : move focus btwn sessions
"

set nocompatible

" plugin handler
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

call plug#begin()
" color
Plug 'sainnhe/everforest'
Plug 'morhetz/gruvbox'

" alignment
Plug 'godlygeek/tabular'

" startpage
Plug 'mhinz/vim-startify'

" build
Plug 'reinh/vim-makegreen'

" browsing
Plug 'scrooloose/NERDTree', { 'on': 'NERDTreeToggle' }
Plug 'Xuyuanp/nerdtree-git-plugin', { 'on': 'NERDTreeToggle' }
Plug 'majutsushi/tagbar', { 'on': 'TagbarToggle' }
Plug 'mbbill/undotree', { 'on': 'UndotreeToggle' }

" typing
Plug 'jiangmiao/auto-pairs'  " auto-complete [], {}, () etc.

" highlight cursor word
Plug 'itchyny/vim-cursorword'"
call plug#end()

" enable filetype plugins
filetype plugin indent on

" commands for auto-reload of VIM when changing the vimrc file
if has("autocmd")
  augroup vimrc
    autocmd!
    autocmd BufWritePost vimrc source $MYVIMRC
  augroup end
endif

" colorscheme
try
    colorscheme gruvbox
catch /^Vim\%((\a\+)\)\=:E185/
    colorscheme slate
endtry
set background=dark

" enable persistent storage
if has('persistent_undo')
    silent !mkdir ~/.vim/backups > /dev/null 2>&1
    set undodir=~/.vim/backups
    set undofile
endif

" indentation rules
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab

" interface
set autoread
set nu
set ruler
set encoding=utf-8
set scrolloff=3
set showmode
set showcmd
set hidden
set wildmenu
set wildmode=list:longest,full
set visualbell
set ttyfast
set backspace=indent,eol,start
set laststatus=2
set wrap
set formatoptions=qrn1
set linebreak
set t_Co=256

" smarter file searching; only use case-sensitive if a capital letter is present
set ignorecase
set smartcase
set gdefault
set incsearch
set showmatch
set bs=2

" hot keys
nnoremap <F1> :NERDTreeToggle<cr>
nnoremap <F2> :UndotreeToggle<cr>
nmap <F3> :TagbarToggle<cr>
nmap <Leader>ss :<C-u>SessionSave<CR>
nmap <Leader>sl :<C-u>SessionLoad<CR>

" don't break from visual mode when changing indentation
vnoremap < <gv
vnoremap > >gv

" nerdtree
let NERDTreeQuitOnOpen=1
let NERDTreeIgnore = ['\.pyc$','__pycache','\.swo']

" visual bell
autocmd GUIEnter * set vb t_vb= " for your GUI
autocmd VimEnter * set vb t_vb=
