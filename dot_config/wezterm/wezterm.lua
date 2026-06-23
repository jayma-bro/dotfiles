local wezterm = require 'wezterm'
local config = wezterm.config_builder()

-- Lance zellij en attachant (ou créant) la session "main"
config.default_prog = { 'zellij', 'attach', '--create', 'main' }

-- Apparence
config.color_scheme = 'Catppuccin Mocha'  -- inclus nativement dans WezTerm
config.font = wezterm.font('JetBrainsMono Nerd Font', { weight = 'Regular' })
config.font_size = 11.0
config.line_height = 1.1

-- Fenêtre
config.hide_tab_bar_if_only_one_tab = true
config.window_decorations = "RESIZE"  -- garde une bordure fine, retire la barre de titre lourde
config.window_padding = {
  left = 8, right = 8, top = 8, bottom = 8,
}

-- Active les décorations de fenêtre (barre de titre + bordures)
config.window_decorations = "TITLE | RESIZE"

-- config.default_prog = { '/usr/bin/fish', '-l', '-c', 'zellij attach -c main' }
-- config.window_close_confirmation = 'NeverPrompt'

-- Performance
config.front_end = "WebGpu"  -- meilleur perf que OpenGL sur ta RTX 4070

-- Désactive le multiplexeur intégré de WezTerm (on utilise Zellij à la place)
config.enable_tab_bar = false
config.window_close_confirmation = 'NeverPrompt'
mouse_bindings = {
  -- Ctrl-click will open the link under the mouse cursor
  {
    event = { Up = { streak = 1, button = "Left" } },
    mods = "CTRL",
    action = wezterm.action.OpenLinkAtMouseCursor,
  },
}

-- Scroll et historique
config.alternate_buffer_wheel_scroll_speed = 1
config.scrollback_lines = 4000

return config
