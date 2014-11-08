# Colorize output, add file type indicator, and put sizes in human readable format
alias ls='ls -GFh'

# Same as above, but in long listing format
alias ll='ls -GFhl'

alias ri='ri -Tf ansi'


alias be='bundle exec'
alias bx='bundle exec'


alias gentags='ctags . && rm .tags;mv tags .tags'

alias thepath='tmuxinator the_path_big'
alias gb='git branch'
alias gc='git checkout'
alias gs='git status'
alias gg='git log --graph'
alias cb='git checkout'
alias so='exec zsh'
alias pull='git pull'
alias cnb='git checkout -b'

alias fuck='sudo $(history -1 |cut -d" " -f4-)'
