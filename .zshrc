eval "$(/opt/homebrew/bin/brew shellenv)"
eval "$(starship init zsh)"
eval "$(fzf --zsh)"

alias ws='open -a /Applications/WebStorm.app --args "$@"'
alias ls='eza --color=always --long --icons=always --no-permissions --no-user --no-time'

export PATH="/opt/homebrew/opt/node@20/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"

# Load Angular CLI autocompletion.
# source <(ng completion script)

[[ -s $(brew --prefix autojump)/etc/profile.d/autojump.sh ]] && source $(brew --prefix autojump)/etc/profile.d/autojump.sh

