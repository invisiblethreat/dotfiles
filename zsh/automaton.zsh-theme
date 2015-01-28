# Clean, simple, compatible and meaningful.
# Tested on Linux, Unix and Windows under ANSI colors.
# It is recommended to use with a dark background and the font Inconsolata.
# Colors: black, red, green, yellow, *blue, magenta, cyan, and white.
# 
# http://ysmood.org/wp/2013/03/my-ys-terminal-theme/
# Mar 2013 ys

# Machine name.
function box_name {
    echo $HOST
}

# Directory info.
local current_dir='${PWD/#$HOME/~}'

# Git info.
local git_info='$(git_prompt_info)'
ZSH_THEME_GIT_PROMPT_PREFIX=" %{$fg[yellow]%}("
ZSH_THEME_GIT_PROMPT_SUFFIX=")%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY=" %{$fg[red]%}%{$fg[yellow]%}"
ZSH_THEME_GIT_PROMPT_CLEAN=" %{$fg[yellow]%}%{$fg[yellow]%}"

PROMPT="
%{$terminfo[bold]$fg[white]%}(%{$reset_color%}\
%{$fg[cyan]%}%n\
%{$fg[white]%}@\
%{$fg[green]%}$(box_name) \
%{$fg[white]%}\
%{$terminfo[bold]$fg[cyan]%}${current_dir}%{$reset_color%})\
${git_info}
%{$terminfo[bold]$fg[white]%}$ %{$reset_color%}"

if [[ $(id -u) == "0" ]]; then
PROMPT="
%{$terminfo[bold]$fg[white]%}(%{$reset_color%}\
%{$fg[red]%}%n%{$reset_color%}\
%{$fg[white]%}@\
%{$fg[green]%}$(box_name) \
%{$fg[white]%}\
%{$terminfo[bold]$fg[cyan]%}${current_dir}%{$reset_color%}\
%{$terminfo[bold]$fg[white]%})%{$reset_color%}\
${git_info}
%{$terminfo[bold]$fg[white]%}# %{$reset_color%}"
fi
