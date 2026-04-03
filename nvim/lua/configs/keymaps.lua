local keymap = vim.keymap

keymap.set("i", "jk", "<ESC>", { desc = "Exit insert mode with jk" })

-- Normal mode: moves lines
keymap.set("n", "<A-j>", ":m .+1<CR>==", { desc = "Move line down" })
keymap.set("n", "<A-k>", ":m .-2<CR>==", { desc = "Move line up" })

-- Visual mode: moves lines
keymap.set("v", "<A-j>", ":m '>+1<CR>gv=gv", { desc = "Move selection down" })
keymap.set("v", "<A-k>", ":m '<-2<CR>gv=gv", { desc = "Move selection up" })

-- Confirmation on quitting if a file is not saved
keymap.set("n", "<leader>qq", ":confirm qa<CR>", { desc = "Quit All with Confirm" })
keymap.set("n", "<C-s>", ":wa<CR>", { desc = "Saving all" })

-- Window navigation
keymap.set('n', '<C-h>', '<C-w>h', { desc = 'Go to Left Window' })
keymap.set('n', '<C-j>', '<C-w>j', { desc = 'Go to Lower Window' })
keymap.set('n', '<C-k>', '<C-w>k', { desc = 'Go to Upper Window' })
keymap.set('n', '<C-l>', '<C-w>l', { desc = 'Go to Right Window' })

-- Split windows
keymap.set('n', '<leader>sv', '<C-w>v', { desc = 'Split Window Vertically' })
keymap.set('n', '<leader>sh', '<C-w>s', { desc = 'Split Window Horizontally' })
keymap.set('n', '<leader>se', '<C-w>=', { desc = 'Make Splits Equal Size' })
keymap.set('n', '<leader>sx', '<cmd>close<cr>', { desc = 'Close Current Split' })
