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

if [ "$1" == "--force" -o "$1" == "-f" ]; then
	doIt;
else
	read -p "This may overwrite existing files in your home directory. Are you sure? (y/n) " -n 1;
	echo "";
	if [[ $REPLY =~ ^[Yy]$ ]]; then
		doIt;
	fi;
fi;
unset doIt;
docker run -e TERM -e COLORTERM -w /root -it --rm ubuntu sh -uec '
  apt-get update
  apt-get install -y zsh curl tmux git rsync grsync
  sh