return {
  "akinsho/toggleterm.nvim",
  version = "*",
  config = function()
    require("toggleterm").setup({
      size = 20,
      open_mapping = [[<C-\>]], -- Press Ctrl + \ to toggle
      hide_numbers = true,
      shade_terminals = true,
      shading_factor = 2,
      direction = "float",
      float_opts = {
        border = "rounded",
        winblend = 3,
      },
    })

    local opts = { noremap = true, silent = true }
    vim.keymap.set('n', '<C-/>', '<cmd>ToggleTerm direction=horizontal<cr>', { desc = "Terminal Horizontal" })
  end
}
