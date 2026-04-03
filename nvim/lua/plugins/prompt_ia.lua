return {
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    config = function()
      require("copilot").setup({
        --DISABLE ALL GHOST TEXT/SUGGESTIONS
        suggestion = { enabled = false },
        panel = { enabled = false },
      })
    end,
  },

  {
    "CopilotC-Nvim/CopilotChat.nvim",
    branch = "main",
    dependencies = {
      { "zbirenbaum/copilot.lua" },
      { "nvim-lua/plenary.nvim" },
    },
    build = "make utf8",
    opts = {
	window = {
		layout = 'float',
		relative = 'editor',
		width = 0.3,
		height = 0.8,
		row = 1,
		col = vim.o.columns,
		border = 'rounded',
	},
	debug = false,
	show_help = "yes",
    },
    keys = {
      { "<leader>cc", "<cmd>CopilotChatToggle<cr>", desc = "Toggle Copilot Chat" },
      {
        "<leader>ce",
        "<cmd>CopilotChatExplain<cr>",
        mode = "v",
        desc = "Explain Selected Code",
      },
    },
  },
}
