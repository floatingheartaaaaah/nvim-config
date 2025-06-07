vim.g.mapleader = " "

local function map(mode, lhs, rhs)
    vim.keymap.set(mode, lhs, rhs, { silent = true })
end

map("n", "<C-e>", vim.cmd.Ex)
map("n", "<C-l>", ":Lazy<CR>")
map("n", "<C-s>", "<C-f>:w<CR>")
map("n", "<C-a>", "ggvG")
map("v", "<C-c>", '"+y')
map("n", "<C-c>", '"+y')
map("n", "<C-u>", "<C-u>zz")
map("n", "<C-d>", "<C-d>zz")
map("v", "y", '"+y')
map("n", "y", '"+y')
map("i","jk","<ESC>")
map("n","<leader>nh",":nohl<CR>")


map("n","<leader>sv","<C-w>v")
map("n","<leader>sh","<C-w>s")
map("n","<leader>se","<C-w>=")
map("n","<leader>sx","<cmd>close<CR>")
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

