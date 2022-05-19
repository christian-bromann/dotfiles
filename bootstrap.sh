#!/usr/bin/env bash

function doIt() {
	echo "Linking files..."
	cp ./.gitconfig ..
    cp ./.p10k-8color.zsh ..
    cp ./.p10k.zsh ..
    cp ./.tmux.conf ..
    cp ./.zshenv ..
    cp ./.zshrc ..
	echo "Switching Login Shell..."
	sudo chsh -s $(which zsh)
    echo "Loading Zsh..."
	zsh
	echo "Done!"
}

doIt;
unset doIt;