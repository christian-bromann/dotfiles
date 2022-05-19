#!/usr/bin/env bash

if (( $USER == "gitpod" )); then
    sudo apt-get install rsync
fi

function doIt() {
	echo "Copy over files..."
	rsync --exclude ".git/" \
		--exclude ".DS_Store" \
		--exclude ".osx" \
		--exclude "bootstrap.sh" \
		--exclude "README.md" \
		--exclude "LICENSE" \
		-avh --no-perms . ~;
	echo "Switching Login Shell..."
	sudo chsh -s $(which zsh)
    echo "Loading Zsh..."
	zsh
	echo "Done!"
}

doIt;
unset doIt;