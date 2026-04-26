-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")

local sidebar_ft = { "aerial", "neo-tree", "Outline", "toggleterm", "trouble", "lazy", "mason" }
local has_opened_file = false

vim.api.nvim_create_autocmd("WinClosed", {
  group = vim.api.nvim_create_augroup("quit_if_only_sidebars", { clear = true }),
  callback = function(args)
    local win = tonumber(args.match)
    local ok, config = pcall(vim.api.nvim_win_get_config, win)
    if ok and config.relative ~= "" then
      return
    end
    vim.schedule(function()
      local wins = vim.api.nvim_list_wins()
      local has_sidebar = false
      for _, w in ipairs(wins) do
        if vim.api.nvim_win_get_config(w).relative == "" then
          local buf = vim.api.nvim_win_get_buf(w)
          local ft = vim.bo[buf].filetype
          if vim.tbl_contains(sidebar_ft, ft) then
            has_sidebar = true
          elseif ft ~= "" or vim.api.nvim_buf_get_name(buf) ~= "" or vim.bo[buf].modified then
            has_opened_file = true
            return
          end
        end
      end
      if has_opened_file or not has_sidebar then
        vim.cmd("qa")
      end
    end)
  end,
})
