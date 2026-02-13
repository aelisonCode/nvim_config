-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

local opt = vim.opt

opt.expandtab = false --Don't transform tabulation to space => keep the tab
opt.list = false --Don't show weird characters
opt.swapfile = false --Do not keep swap files
opt.undofile = true --Let undo infinitly
