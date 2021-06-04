# portable aliases

alias ..='cd ..'
alias b='cd ~/bin'
alias g='cd ~/git'
alias gr="cd $(if [ -d .git ];then git rev-parse --show-toplevel; fi)"

alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -i'

alias l.='ls -d .* --color=auto'
alias ll='ls -l --color=auto'
alias ls='ls --color=auto'

alias serve='sudo python -m SimpleHTTPServer 80 &'
alias tmux='TERM=screen-256color-bce tmux -2'
alias diff='colordiff'
alias less='less -r'
alias lc='wc -l'

alias drop='iptables -A INPUT -j DROP -s'

alias pr='hub pull-request -o'

alias ocs='openssl s_client -connect'
alias x509='openssl x50'

git_status () {

  if [[ ! -d .git  ]]; then
    exit 0
  fi
  CHANGES=$(command git status --porcelain -b 2> /dev/null)
  #CHANGES=$(git status --porcelain)
  ADDED=$(echo $CHANGES | grep -c "^M ")
  MODIFIED=$(echo $CHANGES | grep -c "^ M")
  UNTRACKED=$(echo $CHANGES | grep -c "^??")

  if [[ "$ADDED" != "0" ]]; then
    ADDED="\e[38;5;40m✚ $ADDED\e[0m "
  else
    ADDED=""
  fi

  if [[ "$MODIFIED" != "0" ]]; then
    MODIFIED="\e[38;5;202m⧫ $MODIFIED\e[0m "
  else
    MODIFIED=""
  fi

  if [[ "$UNTRACKED" != "0" ]]; then
    UNTRACKED="\e[38;5;198m� $UNTRACKED\e[0m "
  else
    UNTRACKED=""
  fi

echo $ADDED $MODIFIED $UNTRACKED
}
