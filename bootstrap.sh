#!/usr/bin/env bash

function doIt() {
	echo "Linking files..."
	ln -s ./.gitconfig ..
    ln -s ./.p10k-8color.zsh ..
    ln -s ./.p10k.zsh ..
    ln -s ./.tmux.conf ..
    ln -s ./.zshenv ..
    ln -s ./.zshrc ..
	echo "Switching Login Shell..."
	sudo chsh -s $(which zsh)
    echo "Loading Zsh..."
	zsh
	echo "Done!"
}

doIt;
unset doIt;