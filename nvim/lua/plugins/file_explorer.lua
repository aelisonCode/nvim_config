return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
  },
  config = function()
    require("neo-tree").setup({
      window = {
        position = "float",
        popup = {
          position = { col = "100%", row = "2" },
          size = {
            width = 40,
            height = "80%",
          },
          border = "rounded",
        },
      },
      filesystem = {
        bind_to_cwd = true,
        follow_current_file = { enabled = true },
        use_libuv_file_watcher = true,
        filtered_items = {
          visible = true,
          hide_dotfiles = false,
        },
      },
    })

    vim.keymap.set('n', '<leader>e', ':Neotree toggle<CR>', { desc = "Toggle Right Float Explorer" })
  end
}
