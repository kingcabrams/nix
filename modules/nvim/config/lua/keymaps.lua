local set = vim.keymap.set

set('n', '<Esc>', '<cmd>nohlsearch<CR>')

set("n", "<C-d>", "<C-d>zz")
set("n", "<C-u>", "<C-u>zz")
set("n", "n", "nzzzv")
set("n", "N", "Nzzzv")

set("v", ">", ">gv")
set("v", "<", "<gv")

set("n", "<C-h>", "<C-w>h")
set("n", "<C-j>", "<C-w>j")
set("n", "<C-k>", "<C-w>k")
set("n", "<C-l>", "<C-w>l")

set("n", "<A-m>", "<CMD>make<CR>")

set("n", "'", "`")
set("v", "<leader>y", "\"+y")
set("v", "<leader>Y", "\"+y'>")
set("v", "<leader>p", "\"+p")
set("v", "Y", "y'>")

set("v", "K", ":m '<-2<CR>gv=gv")
set("v", "J", ":m '>+1<CR>gv=gv")

set("n", "<C-a>", "ggVG")
set({"n", "v"}, "<C-h>", ":s/")
