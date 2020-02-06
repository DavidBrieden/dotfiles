#!/bin/bash

BASEDIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

success () {
  printf "[ \e[32m$1\e[39m ] $2\n"
}

error () {
  printf "[ \e[31m$1\e[39m ] $2\n"
}

install_symlink () {
  file=$1

  printf "$file: "

  if [ -L ~/${file} ] ; then
    if [ "$(readlink ~/${file})" = "${BASEDIR}/${file}" ]; then
      success "OK" "already installed"
      return
    else
      error "ERROR" "Another Symlink already exists!"
      return
    fi
  fi

  ln -s ${BASEDIR}/${file} ~/${file}
  success "OK"
}

install_symlink ".gitconfig"
install_symlink ".vimrc"
install_symlink ".zshrc"


