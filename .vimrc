syntax enable
set background=dark
colorscheme solarized

noremap <C-V> "+p
noremap <C-c> "+y
":imap jk <Esc>
":imap ii <Esc>
inoremap kj <esc>
inoremap jk <esc>
inoremap qw <esc>

map <leader>ss :setlocal spell!<cr>

set nocompatible
filetype indent plugin on
filetype on
filetype indent on
filetype plugin on
set ruler
set cursorline
syntax on
syntax enable

set mouse=a
" Prevent incorrect backgroung rendering
let &t_ut=''

" ===
" === Editor behavior
" ===
" Better tab
set expandtab
set tabstop=2
set shiftwidth=2
set softtabstop=2
set list
set listchars=tab:▸\ ,trail:▫
set scrolloff=5
" Prevent auto line split
set wrap
set tw=0

set indentexpr=
" Better backspace
set backspace=indent,eol,start

set foldmethod=indent
set foldlevel=99

let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_SR = "\<Esc>]50;CursorShape=2\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"

" Better command-line completion
set wildmenu
set wildignore=log/**,node_modules/**,target/**,tmp/**,*.rbc
set wildmode=longest,list,full

set incsearch
set smartcase
" Show partial commands in the last line of the screen
set showcmd
set showmode
set ruler
set showmatch
set number

" Highlight searches (use <C-L> to temporarily turn off highlighting; see the
" mapping of <C-L> below)
set hlsearch
exec "nohlsearch"

set ignorecase
" Allow backspacing over autoindent, line breaks and start of insert action
set backspace=indent,eol,start

" When opening a new line and no filetype-specific indenting is enabled, keep
" the same indent as the line you're currently on. Useful for READMEs, etc.
set autoindent

" Always display the status line, even if only one window is displayed
set laststatus=2
set autochdir
set formatoptions-=tc

" ===
" === Window behaviors
" ===
set splitright
set splitbelow

" Instead of failing a command because of unsaved changes, instead raise a
" dialogue asking if you wish to save changed files.
set confirm

" Use visual bell instead of beeping when doing something wrong
set visualbell

set cmdheight=2
" Quickly time out on keycodes, but never time out on mappings
set notimeout ttimeout ttimeoutlen=200

set encoding=utf-8 " encoding used for displaying file
set fileencoding=utf-8 " encoding used when saving file

" file type specific settings
filetype on " enable file type detection
filetype plugin on " load the plugins for specific file types
filetype indent on " automatically indent code
" center view on the search result
noremap n nzz
noremap N Nzz

" press F4 to fix indentation in whole file; overwrites marker 'q' position
noremap <F4> mqggVG=`qzz
inoremap <F4> <Esc>mqggVG=`qzza

" press F5 to sort selection or paragraph
vnoremap <F5> :sort i<CR>
nnoremap <F5> Vip:sort i<CR>

" press F8 to turn the search results highlight off
noremap <F8> :nohl<CR>
inoremap <F8> <Esc>:nohl<CR>a
set grepprg=grep\ -nH\ $*
let g:tex_flavor='latex'
set rtp+=~/.vim/bundle/vundle/
" call vundle#rc()

" let Vundle manage Vundle
" " required! 
" Bundle 'gmarik/vundle'
augroup vimrc_autocmds
    autocmd!
    " highlight characters past column 120
    autocmd FileType python highlight Excess ctermbg=DarkGrey
    autocmd FileType python match Excess /\%120v.*/
    autocmd FileType python set nowrap
    augroup END

" Bundle 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
" Powerline setup
" set guifont=DejaVu\ Sans\ Mono\ for\ Powerline\ 9
" set laststatus=2
" Bundle 'scrooloose/nerdtree'

" map <F2> :NERDTreeToggle<CR>
" Bundle 'klen/python-mode'



" set runtimepath+=~/.vim/bundle/jedi-vim
" set runtimepath-=~/.vim/bundle/python-mode

:imap jk <Esc>
:imap ii <Esc> 



