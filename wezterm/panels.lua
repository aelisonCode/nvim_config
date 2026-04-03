local wezterm = require("wezterm")
local P = {}

P.keys = {
    {
        key = "RightArrow",
        mods = "ALT",
        action = wezterm.action.SplitHorizontal({ domain = "CurrentPaneDomain" }),
    },
    {
        key = "DownArrow",
        mods = "ALT",
        action = wezterm.action.SplitVertical({ domain = "CurrentPaneDomain" }),
    },
}

local arrow_directions = {
    LeftArrow = "Left",
    DownArrow = "Down",
    UpArrow = "Up",
    RightArrow = "Right",
}

-- 1. Move between panes using CTRL + Arrows
for key, dir in pairs(arrow_directions) do
    table.insert(P.keys, {
        key = key,
        mods = "CTRL",
        action = wezterm.action.ActivatePaneDirection(dir),
    })
end

-- 2. Resize panes using SHIFT + Arrows
for key, dir in pairs(arrow_directions) do
    table.insert(P.keys, {
        key = key,
        mods = "SHIFT",
        action = wezterm.action.AdjustPaneSize({ dir, 3 }),
    })
end

return P
