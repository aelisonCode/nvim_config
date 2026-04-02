return {
  {
    "goolord/alpha-nvim",
    event = "VimEnter",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      local alpha = require("alpha")
      local dashboard = require("alpha.themes.dashboard")

      dashboard.section.header.val = {
        "",
        "",
        "",
        "",
        " █████╗ ███████╗██╗     ██╗███████╗ ██████╗ ███╗   ██╗",
        "██╔══██╗██╔════╝██║     ██║██╔════╝██╔═══██╗████╗  ██║",
        "███████║█████╗  ██║     ██║███████╗██║   ██║██╔██╗ ██║",
        "██╔══██║██╔══╝  ██║     ██║╚════██║██║   ██║██║╚██╗██║",
        "██║  ██║███████╗███████╗██║███████║╚██████╔╝██║ ╚████║",
        "╚═╝  ╚═╝╚══════╝╚══════╝╚═╝╚══════╝ ╚═════╝ ╚═╝  ╚═══╝",
        "           ██████╗ ██████╗ ██████╗ ███████╗           ",
        "          ██╔════╝██╔═══██╗██╔══██╗██╔════╝           ",
        "          ██║     ██║   ██║██║  ██║█████╗             ",
        "          ██║     ██║   ██║██║  ██║██╔══╝             ",
        "          ╚██████╗╚██████╔╝██████╔╝███████╗           ",
        "           ╚═════╝ ╚═════╝ ╚═════╝ ╚══════╝           ",
        "",
      }

      -- Set the Menu buttons
      dashboard.section.buttons.val = {
        dashboard.button("l", "󰒲  Lazy", ":Lazy<CR>"),
        dashboard.button("f", "  Find file", ":Telescope find_files <CR>"),
        dashboard.button("e", "  New file", ":ene <BAR> startinsert <CR>"),
        dashboard.button("r", "  Recent files", ":Telescope oldfiles <CR>"),
        dashboard.button("s", "  Settings", ":e $MYVIMRC <CR>"),
		dashboard.button("p", "󰏖  Plugins", ":cd ~/.config/nvim/lua/plugins | e .<CR>"),
		dashboard.button("c", "  Configs", ":cd ~/.config/nvim/lua/configs | e .<CR>"),
        dashboard.button("q", "󰅙  Quit", ":qa<CR>"),
      }
      dashboard.section.footer.val = "Hello there ! Want a cacahuete ?"

      alpha.setup(dashboard.opts)
    end,
  },
}
