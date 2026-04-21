local opt = vim.opt

-- opt.mouse = ""

opt.number = true
opt.relativenumber = true

opt.shiftwidth = 8
opt.tabstop = 8
opt.expandtab = false

opt.termguicolors = true

opt.ignorecase = true
opt.smartcase = true

opt.clipboard = "unnamedplus"
opt.undofile = true
opt.confirm = true
opt.swapfile = false

-- Let wrap some functions, block of code: use keymap "za", "zc"
opt.foldmethod = "syntax"
opt.foldlevel = 99
