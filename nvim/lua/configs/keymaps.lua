local keymap = vim.keymap

-- From insert mode escape to normal mode without pressing the ESC button
-- keymap.set("i", "jk", "<ESC>", { desc = "Exit insert mode with jk" })

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

-- Replace all instances of the word under the cursor
keymap.set("n", "<leader>ra", [[:%s/\<<C-r><C-w>\>/]], { desc = "Replace all instances of word under cursor" })

-- Buffer Navigation
keymap.set("n", "<S-l>", ":bnext<CR>", { desc = "Next Buffer" }) -- Shift + l
keymap.set("n", "<S-h>", ":bprevious<CR>", { desc = "Previous Buffer" }) -- Shift + h

-- Close current buffer
keymap.set("n", "<leader>x", ":bdelete<CR>", { desc = "Close current buffer" })

-- Better indenting: Keep the selection after shifting
keymap.set("v", "<", "<gv", { desc = "Indent left and keep selection" })
keymap.set("v", ">", ">gv", { desc = "Indent right and keep selection" })

-- Clear search highlights with Escape
keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>", { desc = "Clear search highlights" })

-- Keep search results centered
keymap.set("n", "n", "nzzzv")
keymap.set("n", "N", "Nzzzv")

-- Disable Ex mode (it's usually more annoying than helpful)
keymap.set("n", "Q", "<Nop>")

-- Command to access settings
keymap.set("n", "<leader>l", ":Lazy<CR>", { desc = "󰒲 Open lazyvim manager" })
keymap.set("n", "<leader>i", ":e $MYVIMRC <CR>", { desc = " Open init lua file" })
keymap.set("n", "<leader>p", ":cd ~/.config/nvim/lua/plugins | e .<CR>", { desc = "󰏖 Get to plugins" })
keymap.set("n", "<leader>o", ":cd ~/.config/nvim/lua/configs | e .<CR>", { desc = " Get to options" })

