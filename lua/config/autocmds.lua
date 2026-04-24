-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")

local sidebar_ft = { 'aerial', 'neo-tree', 'Outline' }
local has_opened_file = false

vim.api.nvim_create_autocmd('BufEnter', {
    group = vim.api.nvim_create_augroup('quit_if_only_sidebars', { clear = true }),
    callback = function()
        local wins = vim.api.nvim_list_wins()
        for _, win in ipairs(wins) do
            local buf = vim.api.nvim_win_get_buf(win)
            local ft = vim.bo[buf].filetype
            if not vim.tbl_contains(sidebar_ft, ft) and ft ~= '' then
                has_opened_file = true
                return
            end
        end
        if has_opened_file then
            vim.cmd('qa!')
        end
    end,
})
