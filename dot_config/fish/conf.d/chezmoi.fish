if command -q batcat
    abbr --add bat batcat
end
if command -q fdfind
    abbr --add fd fdfind
end

source "$HOME/.atuin/bin/env.fish"
alias config='/usr/bin/git --git-dir=$HOME/.dotfiles --work-tree=$HOME'
