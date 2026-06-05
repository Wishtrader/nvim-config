local keymap = vim.keymap

keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")
keymap.set("n", "<leader>w", "<cmd>write<CR>", { desc = "Save file" })
keymap.set("n", "<leader>q", "<cmd>quit<CR>", { desc = "Quit window" })

keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to left window" })
keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to right window" })
keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to lower window" })
keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to upper window" })

vim.keymap.set("n", "<C-n>", ":botright vnew<CR>")
vim.keymap.set("n", "<Tab>", ":wincmd w<CR>")
vim.keymap.set("n", "<S-Tab>", ":wincmd r<CR>")
