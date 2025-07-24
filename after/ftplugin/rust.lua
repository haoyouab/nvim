local bufnr = vim.api.nvim_get_current_buf()
vim.keymap.set('n', '<leader>a', function()
    vim.cmd.RustLsp('codeAction') -- supports rust-analyzer's grouping
    -- or vim.lsp.buf.codeAction() if you don't want grouping.
end, { desc = 'codeAction', silent = true, buffer = bufnr })
vim.keymap.set(
    'n',
    'K', -- Override Neovim's built-in hover keymap with rustaceanvim's hover actions
    function()
        vim.cmd.RustLsp({ 'hover', 'actions' })
    end,
    { desc = 'hoverAction', silent = true, buffer = bufnr }
)
vim.keymap.set(
    'n',
    '<leader>m', -- Override Neovim's built-in hover keymap with rustaceanvim's hover actions
    function()
        vim.cmd.RustLsp({ 'expandMacro' })
    end,
    { desc = 'expandMacro', silent = true, buffer = bufnr }
)

vim.g.rustaceanvim = {
    server = {
        on_attach = function(client, bufnr)
            -- you can also put keymaps in here
        end,
        settings = {
            -- to enable rust-analyzer settings visit:
            -- https://github.com/rust-analyzer/rust-analyzer/blob/master/docs/user/generated_config.adoc
            ['rust-analyzer'] = {
                -- enable clippy on save
                -- checkOnSave = {
                --     command = 'clippy',
                -- },
                -- cargo = {
                --     allFeatures = true
                -- },
            },
        },
    },
}
