-- Keep track of cursor last position, and set cursor position directly there
vim.api.nvim_create_autocmd("BufReadPost", {
	callback = function()
		local mark = vim.api.nvim_buf_get_mark(0, '"')
		local lcount = vim.api.nvim_buf_line_count(0)
		if mark[1] > 0 and mark[1] <= lcount then
			pcall(vim.api.nvim_win_set_cursor, 0, mark)
		end
	end,
})

-- Shows the lsp error when cursor on it
vim.opt.updatetime = 300
vim.api.nvim_create_autocmd("CursorHold", {
	callback = function()
		local opts = {
			focusable = false,
			close_events = { "CursorMoved", "CursorMovedI", "BufLeave", "InsertEnter" },
			border = "rounded",
			source = "always",
			prefix = " ",
			scope = "cursor",
		}
		vim.diagnostic.open_float(nil, opts)
	end,
})

-- Indent line called
vim.api.nvim_create_autocmd("ColorScheme", {
	pattern = "*",
	callback = function()
		vim.api.nvim_set_hl(0, "IblIndent", { fg = "#3b4261", nocombine = true })
		vim.api.nvim_set_hl(0, "MiniIndentscopeSymbol", { fg = "#bb9af7", bold = true })
	end,
})

vim.api.nvim_set_hl(0, "MiniIndentscopeSymbol", { fg = "#bb9af7", bold = true })
