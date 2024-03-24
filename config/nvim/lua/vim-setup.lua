vim.cmd([[
  set expandtab
  set shiftwidth=2
  set softtabstop=2
  set tabstop=2
]])

vim.g.mapleader = "`"

vim.opt.swapfile = false

-- Navigate vim panes better
vim.keymap.set("n", "<c-down>", ":wincmd k<CR>")
vim.keymap.set("n", "<c-up>", ":wincmd j<CR>")
vim.keymap.set("n", "<c-left>", ":wincmd h<CR>")
vim.keymap.set("n", "<c-right>", ":wincmd l<CR>")

vim.keymap.set("n", "<leader>h", ":nohlsearch<CR>")
vim.wo.number = true

-- Fix a bug with treesitter and ruby indentation
vim.cmd("autocmd FileType ruby setlocal indentkeys-=.")
