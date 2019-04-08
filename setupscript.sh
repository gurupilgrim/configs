#!/bin/bash

# requirements for configs. Run this in bash to install prerequisites

sudo apt update
sudo apt install git -y
sudo apt install ranger -y
sudo apt install fim -y

git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

