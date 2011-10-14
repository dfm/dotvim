#!/bin/bash

DIR="$( cd -P "$( dirname "$0" )" && pwd )"/..

# ====================
# * Update git repos *
# ====================

cd ${DIR}
git submodule update --init

# ===================
# * Backup settings *
# ===================

cd ${HOME}
if [ -e .vim ]
then
    echo "Backing up previous .vim directory..."
    mv .vim .vim.bkp
fi
if [ -e .vimrc ]
then
    echo "Backing up previous .vimrc file..."
    mv .vimrc .vimrc.bkp
fi

# ===========
# * Install *
# ===========

echo "Installing .vim settings..."
cd ${HOME}
ln -Fs ${DIR} .vim
ln -Fs ${DIR}/vimrc .vimrc

