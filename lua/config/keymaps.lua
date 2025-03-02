-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
-- vim.keymap.set('n', '<C-p>', [[<Cmd>BufferLineCycleNext<CR>]], opts)
-- vim.keymap.set('n', '<C-o>', [[<Cmd>BufferLineCyclePrev<CR>]], opts)
-- vim.keymap.set('n', '<C-p>', [[<Cmd>TablineBufferNext<CR>]], opts)
-- vim.keymap.set('n', '<C-o>', [[<Cmd>TablineBufferPrevious<CR>]], opts)
vim.keymap.set('n', '<C-p>', [[<Cmd>bn<CR>]], opts)
vim.keymap.set('n', '<C-o>', [[<Cmd>bp<CR>]], opts)
