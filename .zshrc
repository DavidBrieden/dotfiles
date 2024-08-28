# Use antigen
source $HOME/antigen.zsh

# export RUST_SRC_PATH="$(rustc --print sysroot)/lib/rustlib/src/rust/src"

# Use Oh-My-Zsh
antigen use oh-my-zsh

# Set theme
antigen theme jonathan

# Set plugins (plugins not part of Oh-My-Zsh can be installed using githubusername/repo)
antigen bundle git
antigen bundle nvm
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-completions
antigen bundle zsh-users/zsh-syntax-highlighting

# Apply changes
antigen apply

alias cls=clear
alias n=nvim
