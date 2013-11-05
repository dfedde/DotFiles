# Push and pop directories on directory stack
alias pu='pushd'
alias po='popd'

# Basic directory operations
alias ...='cd ../..'
alias -- -='cd -'

# Super user
alias _='sudo'
alias please='sudo'

#alias g='grep -in'

# Show history
alias history='fc -l 1'

# List direcory contents
alias lsa='ls -lah'
alias l='ls -lA1h'
alias ll='ls -lh'
alias la='ls -lAh'
alias sl=ls # often screw this up

alias myserver='ssh -X -i ~/.ssh/duncansrmtky.pem ec2-user@ec2-54-235-10-94.compute-1.amazonaws.com'
alias myfi='sudo wifi-menu wlp2s0'	#this is for seting up the wifi
alias afind='ack-grep -il'
alias eeshoo='ssh -X -i ~/.ssh/eeshooky.pem ubuntu@107.20.197.244'
alias selenium='java -jar /bin/selenium-server.jar' 
alias vimrc='vim ~/DotFiles/vim/vimrc'
alias mincraft='java -jar ~/Downloads/minecraft.jar'
alias hiwipi='cd ~/repos/hiwipi'
alias aliases='vim ~/DotFiles/zsh/oh-my-zsh/lib/aliases.zsh'
