-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")

-- Save Session.vim on exit so tmux-resurrect can restore nvim via `nvim -S`
vim.api.nvim_create_autocmd("VimLeavePre", {
  group = vim.api.nvim_create_augroup("save_session_for_resurrect", { clear = true }),
  callback = function()
    for _, buf in ipairs(vim.fn.getbufinfo({ buflisted = 1 })) do
      if buf.name ~= "" then
        vim.cmd("mksession! Session.vim")
        return
      end
    end
  end,
})

local sidebar_ft = { "aerial", "neo-tree", "Outline", "toggleterm", "trouble", "lazy", "mason", "snacks_terminal" }
local has_opened_file = false

local function is_sidebar_or_terminal(buf)
  return vim.tbl_contains(sidebar_ft, vim.bo[buf].filetype) or vim.bo[buf].buftype == "terminal"
end

local function is_real_edit_win(buf)
  if is_sidebar_or_terminal(buf) then
    return false
  end
  local ft = vim.bo[buf].filetype
  return ft ~= "" or vim.api.nvim_buf_get_name(buf) ~= "" or vim.bo[buf].modified
end

vim.api.nvim_create_autocmd("QuitPre", {
  group = vim.api.nvim_create_augroup("close_sidebars_on_quit", { clear = true }),
  callback = function()
    local current_win = vim.api.nvim_get_current_win()
    local wins = vim.api.nvim_list_wins()
    for _, w in ipairs(wins) do
      if w ~= current_win and vim.api.nvim_win_get_config(w).relative == "" then
        if is_real_edit_win(vim.api.nvim_win_get_buf(w)) then
          return
        end
      end
    end
    for _, w in ipairs(wins) do
      if w ~= current_win and vim.api.nvim_win_is_valid(w) then
        pcall(vim.api.nvim_win_close, w, true)
      end
    end
  end,
})

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
          if is_sidebar_or_terminal(buf) then
            has_sidebar = true
          elseif is_real_edit_win(buf) then
            has_opened_file = true
            return
          end
        end
      end
      if has_opened_file or not has_sidebar then
        vim.cmd("qa!")
      end
    end)
  end,
})
