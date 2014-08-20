# portable aliases
# non-portable should be in .bash_aliases.local

alias ..='cd ..'
alias b='cd ~/bin'
alias g='cd ~/git'

alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -i'

alias l.='ls -d .* --color=auto'
alias ll='ls -l --color=auto'
alias ls='ls --color=auto'

alias serve='python -m SimpleHTTPServer 80 &'
alias tmux='tmux -2'
alias diff='colordiff'
alias less='less -r'

alias drop='iptables -A INPUT -j DROP -s'
