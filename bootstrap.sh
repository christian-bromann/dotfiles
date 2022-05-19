#!/usr/bin/env bash

SCRIPT=$(readlink -f "$0")
SCRIPTPATH=$(dirname "$SCRIPT")

if test ! -e /ide/bin/gp-code || test ! -v GITPOD_REPO_ROOT; then {
    printf 'error: This script is meant to be run on Gitpod, quiting...\n' && exit 1;
} fi

function doIt() {
	echo "Linking files..."
	sudo cp "$SCRIPTPATH/.gitconfig" "$HOME"
    sudo cp "$SCRIPTPATH/.p10k-8color.zsh" "$HOME"
    sudo cp "$SCRIPTPATH/.p10k.zsh" "$HOME"
    sudo cp "$SCRIPTPATH/.tmux.conf" "$HOME"
    sudo cp "$SCRIPTPATH/.zshenv" "$HOME"
    sudo cp "$SCRIPTPATH/.zshrc" "$HOME"
    echo "Install Fonts"
    sudo mkdir -p ~/.local/share/fonts
    sudo wget https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/FiraCode/Bold/complete/Fira%20Code%20Bold%20Nerd%20Font%20Complete%20Mono.ttf -P ~/.local/share/fonts
    sudo wget https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/FiraCode/Light/complete/Fira%20Code%20Light%20Nerd%20Font%20Complete%20Mono.ttf -P ~/.local/share/fonts
    sudo wget https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/FiraCode/Medium/complete/Fira%20Code%20Medium%20Nerd%20Font%20Complete%20Mono.ttf -P ~/.local/share/fonts
    sudo wget https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/FiraCode/Regular/complete/Fira%20Code%20Regular%20Nerd%20Font%20Complete%20Mono.ttf -P ~/.local/share/fonts
    sudo wget https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/FiraCode/Retina/complete/Fira%20Code%20Retina%20Nerd%20Font%20Complete%20Mono.ttf -P ~/.local/share/fonts
    sudo wget https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/FiraCode/SemiBold/complete/Fira%20Code%20SemiBold%20Nerd%20Font%20Complete%20Mono.ttf -P ~/.local/share/fonts
	echo "Switching Login Shell..."
	sudo chsh -s $(which zsh)
    echo "Loading Zsh..."
	exec zsh
	echo "Done!"
}

doIt;
unset doIt;