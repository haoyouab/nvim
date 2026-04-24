-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
vim.keymap.set('n', '<C-p>', '<C-i>', { desc = 'Jump forward' })
vim.keymap.set('n', '<leader>se', function() Snacks.explorer() end, { desc = 'Snacks Explorer' })
