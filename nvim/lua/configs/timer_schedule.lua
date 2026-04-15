require("timer_schedule").setup({
  times = { "09:49" }, -- Format: "8:30", "10:00"
  messages = { "Break time!" },
  keymaps = {	-- Default keymaps, change to your own if need
    enabled = true,
    start = "<leader>ts",
    stop = "<leader>te",
    status = "<leader>tc",
  },
})
