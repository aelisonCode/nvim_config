return {
	"gbprod/yanky.nvim",
	config = function()
		require("yanky").setup({
			ring = {
				history_length = 50,
				storage = "shada",
				sync_with_numbered_registers = true,
				cancel_event = "update",
			},
			system_clipboard = {
				sync_with_ring = false,
			},
			highlight = {
				on_put = true,
				on_yank = true,
				timer = 100,
			},
			picker = {
				telescope = {
					use_default_mappings = true,
				},
			},
		})

		vim.keymap.set({"n","x"}, "p", "<Plug>(YankyPutAfter)")
		vim.keymap.set({"n","x"}, "P", "<Plug>(YankyPutBefore)")
		vim.keymap.set({"n","x"}, "gp", "<Plug>(YankyGPutAfter)")
		vim.keymap.set({"n","x"}, "gP", "<Plug>(YankyGPutBefore)")
		vim.keymap.set("n", "<c-p>", "<Plug>(YankyPreviousEntry)")
		vim.keymap.set("n", "<c-n>", "<Plug>(YankyNextEntry)")
		vim.keymap.set("n", "<leader>y", ":Telescope yank_history<CR>", { desc = "Open Yank History" })
	end,
}
