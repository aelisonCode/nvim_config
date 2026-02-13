return {
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      style = "night",
      transparent = true,
      styles = {
        sidebars = "transparent",
        floats = "transparent",
      },
      on_colors = function(colors)
        -- Customizing the base colors to match Wezterm colors
        colors.bg = "#011423"
        colors.fg = "#CBE0F0"
        colors.cursor = "#47FF9C"
      end,
    },
  },

  -- Configure LazyVim to load this theme
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "tokyonight",
    },
  },
}
