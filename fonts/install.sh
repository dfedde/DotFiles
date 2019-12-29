#!/bin/sh
install() {
	curl -L -s -o "$1/FiraCode-Retina.ttf" \
		https://github.com/tonsky/FiraCode/blob/master/distr/ttf/FiraCode-Retina.ttf?raw=true
  }

if [ "$(uname -s)" = "Darwin" ]; then
	if command -v brew >/dev/null 2>&1; then
    brew tap homebrew/cask-fonts
    brew cask install font-fira-code
	else
		install ~/Library/Fonts
	fi
else
	mkdir -p ~/.fonts
	install ~/.fonts
fi
