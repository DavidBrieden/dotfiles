" vim-plug autoinstall
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin()
  Plug 'NLKNguyen/papercolor-theme'
  Plug 'scrooloose/nerdtree'
  Plug 'tpope/vim-fugitive'
  Plug 'airblade/vim-gitgutter'
  Plug 'ctrlpvim/ctrlp.vim'
  Plug 'xuyuanp/nerdtree-git-plugin'
  Plug 'vim-airline/vim-airline'
  Plug 'plasticboy/vim-markdown'
  Plug 'vim-airline/vim-airline-themes'
call plug#end()

" Airline Config:
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline_theme='papercolor'

" ctrlp Config:
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']
set updatetime=100

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

set nowrap

" reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" window movement
nnoremap <S-J> <C-W><C-J>
nnoremap <S-K> <C-W><C-K>
nnoremap <S-L> <C-W><C-L>
nnoremap <S-H> <C-W><C-H>

" buffer movement
nnoremap <C-J> :bnext<CR>
nnoremap <C-K> :bprev<CR>
