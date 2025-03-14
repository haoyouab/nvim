-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
vim.g.autoformat = false

vim.opt.clipboard = ""
vim.keymap.set({ "n", "x" }, "y", '"+y')
vim.keymap.set("n", "p", '""p')
-- vim.api.nvim_set_keymap('n', 'ZQ', ':qa<CR>', {})
-- vim.api.nvim_set_keymap('n', 'ZZ', ':wqa<CR>', {})
--
vim.opt.splitbelow = false
vim.opt.wrap = true
vim.opt.ignorecase = false
