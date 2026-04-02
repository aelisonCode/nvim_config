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
