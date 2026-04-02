return {
  "gbprod/yanky.nvim",
  config = function()
    require("yanky").setup({
      ring = {
        history_length = 50, -- Optimized for speed while still holding plenty of snippets
        storage = "shada",   -- Faster than sqlite on Linux systems
        sync_with_numbered_registers = true,
        cancel_event = "update",
      },
      system_clipboard = {
        -- Set to false to stop the micro-stutters when copying large blocks of code
        sync_with_ring = false, 
      },
      highlight = {
        on_put = true,
        on_yank = true,
        timer = 100, -- A faster 100ms flicker to keep the UI feeling "snappy"
      },
      picker = {
        telescope = {
          use_default_mappings = true, -- Keeps it consistent with your other searches
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
