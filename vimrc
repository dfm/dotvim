" Vundle

filetype off
set nocompatible

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'

Plugin 'altercation/vim-colors-solarized'

" Code completion and snippets.
" Bundle 'Valloric/YouCompleteMe'
Plugin 'davidhalter/jedi-vim'
Plugin 'Shougo/neocomplete.vim'
Plugin 'ervandew/supertab'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'scrooloose/syntastic'
Plugin 'hynek/vim-python-pep8-indent'
Plugin 'tpope/vim-commentary'
Plugin 'junegunn/goyo.vim'
Plugin 'powerline/powerline', {'rtp': 'powerline/bindings/vim/'}

call vundle#end()            " required
filetype plugin indent on    " required

" End Vundle
"
set encoding=utf8

syntax on
set autoindent

let mapleader=","

let g:UltiSnipsExpandTrigger="<leader>m"

" Return to last edit position when opening files (You want this!)
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif

" Remember info about open buffers on close
set viminfo^=%

" fuck yeah!
command! W :w
command! Q :q

" No toolbar in the gui.
set guioptions-=T

set number
set numberwidth=3
highlight LineNr ctermbg=darkgrey

set title
set ruler
set virtualedit=block
set backspace=2             " Allow backspacing over autoindent, EOL, etc.
set showmatch               " Match parentheses
set matchpairs+=<:>         "   - also for angle bracket pairs
set nowrap
set foldlevel=99
set ww=<,>,[,],h,l,b,s,~

" Tabbing
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set shiftround              " Rounds indent to multiple of shiftwidth

" Don't autosave anything
set noautowrite
set noautowriteall
set noswapfile
set nobackup
set nowb
set autoread                " Automatically read saved files

" Status line
set laststatus=2            " Always show it
set statusline=%<%f\ %y

" Tab completion in command mode
set wildmenu
set wildmode=full
set wildignore+=.hg,.git,.svn
set wildignore+=*.aux,*.out,*.toc
set wildignore+=*.jpg,*.bmp,*.gif,*.png,*.jpeg
set wildignore+=*.pdf
set wildignore+=*.dat
set wildignore+=*.o,*.so
set wildignore+=*.pyc
set wildignore+=*.sw?
set wildignore+=*.DS_Store?
set wildignore+=venv
set wildignore+=*.fits,*.hdf5,*.h5

" Show invisibles
set listchars=tab:▸\ ,eol:¬
set list

" Color column 79
if exists("&colorcolumn")
    set colorcolumn=79
endif

" Searching
set ignorecase              " Default to using case insensitive searches,
set smartcase               " unless uppercase letters are used in the regex.
set hlsearch                " Highlight searches by default.
set incsearch               " Incrementally search while typing a /regex

" Spell check
set spell
setlocal spell spelllang=en_us

" Un-highlight search when we hit enter
autocmd BufRead,BufNewFile * nnoremap <buffer><cr> :nohlsearch<cr>

" Clean up whitespace at the ends of lines before writing
autocmd BufWritePre * :%s/\s\+$//e
autocmd BufNewFile,BufRead *.less set filetype=css

"
" =============================================
" * A little bit of mumbo jumbo from          *
" * Steve Losh's Learn Vimscript the Hard Way *
" =============================================
"

" Edit and source .vimrc file
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

" Move a line up/down in a file
nnoremap - ddp
nnoremap _ ddkkp

" Surround a word in double quotes
nnoremap <leader>" viw<esc>a"<esc>hviwo<esc>i"<esc>lel
nnoremap <leader>' viw<esc>a'<esc>hviwo<esc>i'<esc>lel

" A better mapping for leaving insert mode
inoremap jk <esc>
" inoremap <esc> <nop>

" " Train my muscles to forget arrow keys!
" noremap <Left>  <nop>
" noremap <Right> <nop>
" noremap <Up>    <nop>
" noremap <Down>  <nop>

" jump to beginning/end of lines
noremap H ^
noremap L g_

" Save current file with ,.
nnoremap <leader>. :w<cr>
" Make with ,m
nnoremap <leader>m :make<cr>

" Window resizing
noremap <C-h> <C-w>>
noremap <C-j> <C-W>-
noremap <C-k> <C-W>+
noremap <C-l> <C-w><

" Yank, comment, paste.
nmap <leader>y Y\\\P
vmap <leader>y ygv\\P


"
" ===========================
" * Copy & Paste from Micha *
" ===========================
"

vmap <leader>c ! pbcopy<CR>u
nmap <leader>v :set paste<CR>! pbpaste<CR>:set nopaste<CR>

"
" =========
" * Prose *
" =========
"
" http://contsys.tumblr.com/post/491802835/vim-soft-word-wrap
"
" Wrap prose the way I want it.
noremap <leader>w vasgq


function Prose ()
    set formatoptions+=t
    set linebreak
    set wrap
    set nolist
    set display=lastline
    " set breakat="\ |@-+;:,./?^I"
    nnoremap j gj
    nnoremap k gk
    vnoremap j gj
    vnoremap k gk
endfunction

"
" ===========
" * Plugins *
" ===========
"

" Neocomplete
let g:acp_enableAtStartup = 0
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_smart_case = 1
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=python3complete#Complete

" Solarized colorscheme
set t_Co=256
set background=light
let g:solarized_termtrans=1
colorscheme solarized
highlight Normal ctermbg=none

" Snippets
let g:snippets_dir='~/.vim/snippets'

" ==========
" * Python *
" ==========

let g:syntastic_python_flake8_args='--ignore=E302'

"
" =========
" * LaTeX *
" =========
"

au BufRead,BufNewFile *.tex set wrap textwidth=78
au BufRead,BufNewFile *.tex set noai
au BufRead,BufNewFile *.tex call Prose()


" =================
" * Documentation *
" =================
"

au BufRead,BufNewFile *.md  set wrap textwidth=78
au BufRead,BufNewFile *.markdown  set wrap textwidth=78
au BufRead,BufNewFile *.rst  set wrap textwidth=78
au BufRead,BufNewFile *.md set filetype=markdown


" ==============
" * Javascript *
" ==============

au BufRead,BufNewFile *.js set tabstop=2
au BufRead,BufNewFile *.js set shiftwidth=2
au BufRead,BufNewFile *.js set softtabstop=2


" ===========
" * Fortran *
" ===========

au BufRead,BufNewFile *.f,*.f96,*.f90,*.f66,*.f77 set tabstop=2
au BufRead,BufNewFile *.f,*.f95,*.f90,*.f66,*.f77 set shiftwidth=2
au BufRead,BufNewFile *.f,*.f95,*.f90,*.f66,*.f77 set softtabstop=2

if filereadable(glob("~/.vimrc.local"))
    source ~/.vimrc.local
endif
