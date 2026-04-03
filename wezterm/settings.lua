local wezterm = require 'wezterm'

local settings = {
    initial_cols = 185,
    initial_rows = 52,
    font = wezterm.font('Hack Nerd Font'),
    font_size = 10,
    enable_tab_bar = false,
    hide_mouse_cursor_when_typing = true,
    window_decorations = "RESIZE",
    warn_about_missing_glyphs = false,
    window_padding = {
        left = 12,
        right = 12,
        top = 12,
        bottom = 12,
    },
}

return settings
