
  Plug 'ctrlpvim/ctrlp.vim' " file selection via ctrl+p
  Plug 'plasticboy/vim-markdown'
  Plug 'rust-lang/rust.vim'
  " Plug 'racer-rust/vim-racer'
  Plug 'vim-syntastic/syntastic'
 
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'mkitt/tabline.vim'

  Plug 'posva/vim-vue'

  Plug 'mattn/emmet-vim'
 
  Plug 'neoclide/coc.nvim', {'branch': 'release'}


    Plug 'hrsh7th/vim-vsnip'
 
    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugin configs
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


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

" let g:ycm_keep_logfiles = 1
" let g_ycm_log_level = 'debug'
let g:ycm_rust_src_path = $RUST_SRC_PATH
let g:ycm_autoclose_preview_window_after_insertion = 1


" reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

autocmd Filetype sh setlocal tabstop=2

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Keymaps
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
