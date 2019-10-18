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

" Show line numbers
set number

" Show file stats
set ruler

" 2 Spaces instead of Tab
set expandtab
set tabstop=2

" Status bar
set laststatus=2

" buffer movement
map <C-J> :bnext<CR>
map <C-K> :bprev<CR>