# things that shouldn't be in Git
if [ -e ~/.bash_profile.local ]; then
  source ~/.bash_profile.local
fi

if [ -e ~/.bashrc ]; then
  source ~/.bashrc
fi

# global aliases, suitable for all hosts
if [ -e ~/.bash_aliases ]; then
  source ~/.bash_aliases
fi

# local aliases
if [ -e ~/.bash_aliases.local ]; then
  source ~/.bash_aliases.local
fi

if [ -e ~/.bash_exports ]; then
  source ~/.bash_exports
fi

if [ -e ~/.bash_exports.local ]; then
  source ~/.bash_exports.local
fi

# pretty prompt
if [ -e ~/.bash_prompt ]; then
  source ~/.bash_prompt
fi

# TMUX_AUTO should be set in .bash_profile.local
if [ -e ~/.tmux/auto ] && [ "$TMUX_AUTO" == "1" ]; then
  source ~/.tmux/auto
fi

PATH=$HOME/bin:$PATH
stty stop ''
stty start ''
stty -ixon
stty -ixoff
PROMPT_COMMAND='echo "$(history 1)" >> ~/.bash_eternal_history'
