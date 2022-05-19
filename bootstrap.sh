#!/usr/bin/env bash

SCRIPT=$(readlink -f "$0")
SCRIPTPATH=$(dirname "$SCRIPT")

function doIt() {
	echo "Linking files..."
	sudo cp "$SCRIPTPATH/.gitconfig" ..
    sudo cp "$SCRIPTPATH/.p10k-8color.zsh" ..
    sudo cp "$SCRIPTPATH/.p10k.zsh" ..
    sudo cp "$SCRIPTPATH/.tmux.conf" ..
    sudo cp "$SCRIPTPATH/.zshenv" ..
    sudo cp "$SCRIPTPATH/.zshrc" ..
	echo "Switching Login Shell..."
	sudo chsh -s $(which zsh)
    echo "Loading Zsh..."
	zsh
	echo "Done!"
}

doIt;
unset doIt;