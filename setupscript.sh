#!/bin/bash

# requirements for configs. Run this in bash to install prerequisites

sudo apt update
sudo apt install git -y
sudo apt install ranger -y
sudo apt install fim -y
sudo apt install python3 -y
sudo apt install python3-pip -y
sudo apt install fuse libfuse2 ack-grep -y
sudo apt install liballegro4-dev -y
pip3 install --upgrade pip
pip3 install --user pynvim

mkdir -p ~/.vim/pack/completor/start
git clone https://github.com/maralla/completor.vim.git ~/.vim/pack/completor/start
pack install ~/.vim/pack/completor/start/maralla/completor.vim


#git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

vim +PlugInstall +qall
vim +BundleInstall +qall
vim +GoInstallBinaries +qall
