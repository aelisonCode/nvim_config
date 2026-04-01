local wezterm = require 'wezterm'

local settings = {
    initial_cols = 175,
    initial_rows = 45 ,
    font = wezterm.font('Hack Nerd Font'),
    font_size = 11,
    enable_tab_bar = false,
    hide_mouse_cursor_when_typing = true,
    window_decorations = "RESIZE",
    window_padding = {
        left = 12,
        right = 12,
        top = 12,
        bottom = 12,
    },
}

return settings
