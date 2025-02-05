-- bootstrap lazy.nvim, LazyVim and your plugins
require('config.lazy')
require('config.toggle-term')

vim.opt.relativenumber = false
vim.opt.mouse = 'r'
vim.cmd('colorscheme vscode')
vim.opt.termguicolors = true

vim.api.nvim_create_autocmd('BufEnter', {
    callback = function()
        if vim.bo.filetype == 'Outline' and vim.fn.winnr('$') == 1 then
            vim.cmd('qa')
        end
    end,
})
