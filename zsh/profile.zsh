# TMUX_AUTO should be set in .profile_local.zsh
if [ -e ~/.tmux/auto ] && [ "$TMUX_AUTO" == "1" ]; then
  source ~/.tmux/auto
fi

PATH=$HOME/bin:$PATH
stty stop ''
stty start ''
stty -ixon
stty -ixoff
