# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh
ZSH_THEME="automaton"
CASE_SENSITIVE="true"
HIST_STAMPS="yyyy-mm-dd"
plugins=(zsh-syntax-highlighting)

DISABLE_AUTO_UPDATE=true
DISABLE_UPDATE_PROMPT=true
DISABLE_AUTO_TITLE=true
source $ZSH/oh-my-zsh.sh

export PATH="$HOME/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"

[[ -r ~/.zsh/exports.zsh ]] && . ~/.zsh/exports.zsh
[[ -r ~/.zsh/aliases.zsh ]] && . ~/.zsh/aliases.zsh

# Override the defaults here if necessary
[[ -r ~/.zsh/load_locals.zsh ]] && . ~/.zsh/load_locals.zsh

[[ -r ~/.tmux/auto ]] && [[ "$TMUX_AUTO" == "1" ]] && source ~/.tmux/auto