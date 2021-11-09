" vim-plug autoinstall
if has('unix')
  if empty(glob('$HOME/.vim/autoload/plug.vim'))
    silent !curl -fLo $HOME/.vim/autoload/plug.vim --create-dirs
      \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
  endif
endif

call plug#begin()
  Plug 'vim-airline/vim-airline' " status/tabline
  Plug 'vim-airline/vim-airline-themes'
  Plug 'NLKNguyen/papercolor-theme'
  Plug 'scrooloose/nerdtree' " file tree
  Plug 'xuyuanp/nerdtree-git-plugin'
  Plug 'tpope/vim-fugitive' " git plugin
  Plug 'airblade/vim-gitgutter' " shows git changes
  Plug 'ctrlpvim/ctrlp.vim' " file selection via ctrl+p
  Plug 'plasticboy/vim-markdown'
  Plug 'rust-lang/rust.vim'
  " Plug 'racer-rust/vim-racer'
  Plug 'majutsushi/tagbar'
  Plug 'vim-syntastic/syntastic'
  Plug 'preservim/nerdcommenter'
  Plug 'valloric/youcompleteme'
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'mkitt/tabline.vim'
  Plug 'mhinz/vim-startify'
  Plug 'posva/vim-vue'
  Plug 'qpkorr/vim-bufkill'
  Plug 'mattn/emmet-vim'
  Plug 'dense-analysis/ale' " Linting

  if has('nvim')
    Plug 'Xuyuanp/scrollbar.nvim'
    Plug 'tversteeg/registers.nvim', { 'branch': 'main' }
  endif
call plug#end()

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugin configs
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Airline config:
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline_theme='papercolor'

" ctrlp config:
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']
set updatetime=100

" rust config:
let g:rustfmt_autosave = 1

" racer-rust config:
" let g:racer_cmd = "~/.cargo/bin/racer"
" let g:racer_experimental_completer = 1
" let g:racer_insert_paren = 1

" NERDTree
" Close Vim if only NERDTree is open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" hide node_modules in NERDTree
let g:NERDTreeIgnore = ['^node_modules$', '^\.git$']
let NERDTreeShowHidden=1

" NERDCommenter
let g:NERDSpaceDelims = 1

" let g:ycm_keep_logfiles = 1
" let g_ycm_log_level = 'debug'
let g:ycm_rust_src_path = $RUST_SRC_PATH
let g:ycm_autoclose_preview_window_after_insertion = 1

" ALE
let g:ale_linters = {'javascript': ['eslint'], 'vue': ['eslint']}
let g:ale_fixers = {'javascript': ['eslint'], 'vue': ['eslint']}
let g:ale_linters_explicit = 1
let g:ale_completion_enabled = 1
let g:ale_fix_on_save = 1

""""""""""""""""
" Neovim:
""""""""""""""""

if has('nvim')
  " Scrollbar
  augroup ScrollbarInit
    autocmd!
    autocmd CursorMoved,VimResized,QuitPre * silent! lua require('scrollbar').show()
    autocmd WinEnter,FocusGained           * silent! lua require('scrollbar').show()
    autocmd WinLeave,BufLeave,BufWinLeave,FocusLost            * silent! lua require('scrollbar').clear()
  augroup end
endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" generally VIM configs
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Color Scheme
set t_Co=256
set background=dark
colorscheme PaperColor

" Enhance command-line completion
set wildmenu
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
set shiftwidth=2
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
set scrolloff=10
set nowrap
" Changing buffers without saving
set hidden
" Set Linear at 80 chars
set cc=80
" Don't litter swp files everywhere
set backupdir=~/.cache
set directory=~/.cache
" new buffer splits should be at the bottom/right
set splitbelow
set splitright

" reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

autocmd Filetype sh setlocal tabstop=2

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Keymaps
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let mapleader = " "

" Editing .vimrc
nnoremap <leader>ev :split $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

" Tagbar
nmap <F8> :TagbarToggle<CR>
" NERDTree
nmap <F9> :NERDTreeToggle<CR>

" window movement
nnoremap <S-J> <C-W><C-J>
nnoremap <S-K> <C-W><C-K>
nnoremap <S-L> <C-W><C-L>
nnoremap <S-H> <C-W><C-H>

" buffer movement
nnoremap <C-L> :bnext<CR>
nnoremap <C-J> :bnext<CR>
nnoremap <C-K> :bprev<CR>
nnoremap <C-H> :bprev<CR>

