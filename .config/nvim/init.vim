source $HOME/dotfiles/.vimrc


source $HOME/dotfiles/.config/nvim/lsp.vim

" luafile $HOME/dotfiles/.config/nvim/lsp.lua
luafile $HOME/dotfiles/.config/nvim/config.lua

" Scrollbar
augroup ScrollbarInit
  autocmd!
  autocmd CursorMoved,VimResized,QuitPre * silent! lua require('scrollbar').show()
  autocmd WinEnter,FocusGained           * silent! lua require('scrollbar').show()
  autocmd WinLeave,BufLeave,BufWinLeave,FocusLost            * silent! lua require('scrollbar').clear()
augroup end
