#!/bin/sh
if [ ! -e ~/.vim/bundle/Vundle.vim ]; then
  git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
fi

vim +'PluginInstall' +qa
vim +'PluginClean' +qa
vim +'PluginUpdate' +qa
