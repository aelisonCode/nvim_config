return {
  "aelisonCode/modal_reminder.nvim",
  opts = {
    title = "Little reminder",
    message = "Do not forget to take a break !",
    keymaps = {
      enabled = true,
      launch = "<leader>tw",
    },
  },
  config = function(_, opts)
    require("window_reminder").setup(opts)
  end,
}
