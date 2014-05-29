#! /bin/sh

# Run from the vim directory

git submodule update --init --recursive
ln -s .vim/vimrc ../.vimrc 
cd ..
mv vim .vim
cd .vim

