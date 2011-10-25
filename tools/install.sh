#!/bin/bash

DOTVIM_DIR="$( cd -P "$(dirname $( dirname "$0" ))" && pwd )"

# ====================
# * Update git repos *
# ====================

(cd $DOTVIM_DIR; git submodule update --init)

# ===================
# * Backup settings *
# ===================

if [ -e ~/.vim ]
then
    echo "Backing up previous .vim directory..."
    mv ~/.vim ~/.vim.bkp
fi
if [ -e .vimrc ]
then
    echo "Backing up previous .vimrc file..."
    mv ~/.vimrc ~/.vimrc.bkp
fi

# ===========
# * Install *
# ===========

echo "Installing .vim settings..."
cd ${HOME}
ln -Fs $DOTVIM_DIR ~/.vim
ln -Fs $DOTVIM_DIR/vimrc ~/.vimrc

