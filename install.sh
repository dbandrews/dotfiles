#!/bin/bash

source ./install_zsh.sh
source ./install_starship.sh

ln -sfn ~/dotfiles/.bash_profile ~/.bash_profile
ln -sfn ~/dotfiles/.bashrc ~/.bashrc
ln -sfn ~/dotfiles/.gitconfig ~/.gitconfig
ln -sfn ~/dotfiles/.gitignore_global ~/.gitignore_global
ln -sfn ~/dotfiles/.zshrc ~/.zshrc
ln -sfn ~/dotfiles/.aliases ~/.aliases
ln -sfn ~/dotfiles/settings.json ~/.vscode-server/data/Machine/settings.json
ln -sfn ~/dotfiles/settings.json ~/.vscode-server-insiders/data/Machine/settings.json
ln -sfn ~/dotfiles/settings.json ~/.cursor-server/data/Machine/settings.json
ln -sfn ~/dotfiles/starship.toml ~/.config/starship.toml

echo "Setting up Git"

defaultName=$( git config --global user.name )
defaultEmail=$( git config --global user.email )

read -rp "Name [$defaultName] " name
read -rp "Email [$defaultEmail] " email

git config --global user.name "${name:-$defaultName}"
git config --global user.email "${email:-$defaultEmail}"
git config --global core.excludesfile ~/.gitignore_global

conda config --set changeps1 False
