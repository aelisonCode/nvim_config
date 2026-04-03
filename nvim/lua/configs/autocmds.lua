-- Shows the lsp error when cursor on it
vim.opt.updatetime = 500
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

vim.api.nvim_create_autocmd("ColorScheme", {
  pattern = "*",
  callback = function()
    vim.api.nvim_set_hl(0, "IblIndent", { fg = "#3b4261", nocombine = true })
    vim.api.nvim_set_hl(0, "MiniIndentscopeSymbol", { fg = "#bb9af7", bold = true })
  end,
})

vim.api.nvim_set_hl(0, "MiniIndentscopeSymbol", { fg = "#bb9af7", bold = true })
