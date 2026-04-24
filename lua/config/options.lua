-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
vim.g.autoformat = false

vim.opt.clipboard = ""
vim.keymap.set({ "n", "x" }, "y", '"+y')

vim.opt.relativenumber = false
vim.opt.mouse = 'r'
vim.opt.splitbelow = false
vim.opt.wrap = true
vim.opt.ignorecase = false
vim.opt.showtabline = 2
