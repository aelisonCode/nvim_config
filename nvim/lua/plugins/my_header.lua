return {
  "aelisonCode/header.nvim",
  config = function()
    require("header").setup({
      author = "aelison",
      contact = "github.com/aelisonCode",
      key = "<F2>", -- Default keymap is <F2>
    })
  end,
}
