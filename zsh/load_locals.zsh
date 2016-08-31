[[ -r ~/.local_profile.zsh ]] && . ~/.local_profile.zsh
[[ -r ~/.local_exports.zsh ]] && . ~/.local_exports.zsh

# Order matters- If an export is used in an alias, it's helpful if we
# set it before attempting to use it
[[ -r ~/.local_aliases.zsh ]] && . ~/.local_aliases.zsh
