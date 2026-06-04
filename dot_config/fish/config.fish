if status is-interactive
    # Commands to run in interactive sessions can go here
    # fish_vi_key_bindings
end
# ───── Alias pour outils modernes ─────
alias ls 'eza --icons --group-directories-first'
alias ll 'eza -lah --icons --group-directories-first --git'
alias lt 'eza --tree --level=2 --icons'
alias bcat 'batcat --paging=never'
alias fd 'fdfind'  # Contournement du nom Debian

# ───── Variables d'environnement ─────
set -gx EDITOR nano  # ou vim/nvim selon ta préférence
set -gx BAT_THEME "Catppuccin-mocha"

# ───── Initialisations ─────
starship init fish | source
zoxide init fish | source
atuin init fish | source

# ───── Désactive le message de bienvenue ─────
set -U fish_greeting ""
