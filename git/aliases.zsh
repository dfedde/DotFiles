#!/bin/sh
if command -v hub >/dev/null 2>&1; then
	alias git='hub'
fi

alias glog="git log --graph --decorate --oneline --abbrev-commit"
alias gs='git status -sb'
alias gst='git status -sb'

if command -v svu >/dev/null 2>&1; then
	alias gtpatch='echo `svu p`; git tag `svu p`'
	alias gtminor='echo `svu m`; git tag `svu m`'
fi

gi() {
	curl -s "https://www.gitignore.io/api/$*"
}
