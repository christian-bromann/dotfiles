#!/usr/bin/env bash

SCRIPT=$(readlink -f "$0")
SCRIPTPATH=$(dirname "$SCRIPT")

function doIt() {
	echo "Linking files..."
	sudo cp "$SCRIPTPATH/.gitconfig" "$HOME"
    sudo cp "$SCRIPTPATH/.p10k-8color.zsh" "$HOME"
    sudo cp "$SCRIPTPATH/.p10k.zsh" "$HOME"
    sudo cp "$SCRIPTPATH/.tmux.conf" "$HOME"
    sudo cp "$SCRIPTPATH/.zshenv" "$HOME"
    sudo cp "$SCRIPTPATH/.zshrc" "$HOME"
	echo "Switching Login Shell..."
	sudo chsh -s $(which zsh)
    echo "Loading Zsh..."
	zsh
	echo "Done!"
}

doIt;
unset doIt;