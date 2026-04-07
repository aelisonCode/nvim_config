return {
  "echasnovski/mini.indentscope",
  version = false,
  opts = {
    symbol = "▎",
    draw = {
      delay = 100,
      animation = nil,
    },
    options = {
      border = "both",
      try_as_border = true,
      -- indent_at_cursor = false,
    },
  },
  init = function()
    vim.api.nvim_create_autocmd("FileType", {
      pattern = { "help", "alpha", "dashboard", "neo-tree", "Trouble", "lazy", "mason" },
      callback = function()
        vim.b.miniindentscope_disable = true
      end,
    })
  end,
}
