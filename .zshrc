eval "$(/opt/homebrew/bin/brew shellenv)"
eval "$(starship init zsh)"

alias ws='open -a /Applications/WebStorm.app --args "$@"'

export PATH="/opt/homebrew/opt/node@20/bin:$PATH"

# Load Angular CLI autocompletion.
# source <(ng completion script)

[[ -s $(brew --prefix autojump)/etc/profile.d/autojump.sh ]] && source $(brew --prefix autojump)/etc/profile.d/autojump.sh

