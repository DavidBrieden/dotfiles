" vim-plug autoinstall
""  if empty(glob('~/.vim/autoload/plug.vim'))
""    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
""     \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
""   autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
"" endif

call plug#begin()
  Plug 'NLKNguyen/papercolor-theme'
  Plug 'scrooloose/nerdtree'
  Plug 'tpope/vim-fugitive'
  Plug 'airblade/vim-gitgutter'
  Plug 'ctrlpvim/ctrlp.vim'
  Plug 'xuyuanp/nerdtree-git-plugin'
  Plug 'vim-airline/vim-airline'
call plug#end()

" Color Scheme
set t_Co=256
set background=dark
colorscheme PaperColor

" Enhance command-line completion
set wildmenu
" Don’t add empty newlines at the end of files
set binary
" File specific vim settings
set modeline
" Enable per-directory .vimrc files and disable unsafe commands in them
set exrc
set secure
" Show line numbers
set number
" Show file stats
set ruler
" 2 Spaces instead of Tab
set expandtab
set tabstop=2
" Status bar
set laststatus=2
" Enable syntax highlighting
syntax on
" Highlight current line
set cursorline
" Show “invisible” characters
set lcs=tab:▸\ ,trail:·,eol:¬,nbsp:_
set list
" Highlight searches
set hlsearch
" Ignore case of searches
set ignorecase
" Highlight dynamically as pattern is typed
set incsearch
" Enable mouse in all modes
set mouse=a
" Disable error bells
set noerrorbells
" Start scrolling three lines before the horizontal window border
set scrolloff=3


" buffer movement
map <C-J> :bnext<CR>
map <C-K> :bprev<CR>
