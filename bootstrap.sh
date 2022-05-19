#!/usr/bin/env bash

function doIt() {
	echo "Copy over files..."
	rsync --exclude ".git/" \
		--exclude ".DS_Store" \
		--exclude ".osx" \
		--exclude "bootstrap.sh" \
		--exclude "README.md" \
		--exclude "LICENSE" \
		-avh --no-perms . ~;
	echo "Loading Zsh"
	chsh -s $(which zsh)
    zsh
	echo "Done!"
}

doIt;
unset doIt;