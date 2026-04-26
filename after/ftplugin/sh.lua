if vim.fn.findfile(".editorconfig", ".;") == "" then
  vim.cmd.setlocal("shiftwidth=8")
  vim.cmd.setlocal("tabstop=8")
  vim.cmd.setlocal("noexpandtab")
  vim.cmd.setlocal("textwidth=80")
end
