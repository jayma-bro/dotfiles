if status is-interactive
    # Commands to run in interactive sessions can go here
    # fish_vi_key_bindings
end
# ───── Alias pour outils modernes ─────
alias ls 'eza --icons --group-directories-first'
alias ll 'eza -lahg --icons --group-directories-first --git'
alias lt 'eza --tree --level=2 --icons'

# ───── Variables d'environnement ─────
set -gx EDITOR hx  # ou vim/nvim selon ta préférence
set -gx BAT_THEME "Catppuccin-mocha"

# ───── Initialisations ─────
starship init fish | source
zoxide init fish | source
atuin init fish | source

fish_add_path ~/.local/bin

# ───── Désactive le message de bienvenue ─────
set -U fish_greeting ""

# Mammouth Code
set -gx PATH $HOME/.mammouth/bin $PATH
