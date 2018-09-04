#!/bin/sh

echo "THIS WILL DELETE FILES FROM $HOME"
read -p "Continue? [y/N] " -r
if [[ ! $REPLY =~ ^[Yy]$ ]]; then
    exit 1
fi

files=$(find -maxdepth 1 -type f | sed "s|^\./||")
for file in $files; do
    rm ~/${file}
    ln -s $(pwd)/${file} ~/${file}
done

dirs=$(find -maxdepth 1 -type d | sed "s|^\./||")
for dir in $dirs; do
    rm -rf ~/${dir}
    ln -s $(pwd)/${dir} ~/${dir}
done

if [ -d "/home/dvratil/.vim/bundle/Vundle.vim" ]; then
    echo "Vundle for Vim already exists"
else
    mkdir -p ~/.vim/bundle
    git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
fi

if [ -d "/home/dvratil/.oh-my-zsh" ]; then
    echo "Oh-my-zsh already exists"
else
    git clone --depth=1 https://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
fi
