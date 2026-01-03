local key = vim.keymap

key.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

key.set("n", "<C-d>", "<C-d>zz")
key.set("n", "<C-u>", "<C-u>zz")
key.set("n", "n", "nzzzv")
key.set("n", "N", "Nzzzv")

key.set("v", ">", ">gv")
key.set("v", "<", "<gv")

key.set("n", "<leader>t", "<CMD>split | term<CR>i")
key.set("t", "<esc>", "<C-\\><C-n>")

key.set("n", "<C-h>", "<C-w>h")
key.set("n", "<C-j>", "<C-w>j")
key.set("n", "<C-k>", "<C-w>k")
key.set("n", "<C-l>", "<C-w>l")
