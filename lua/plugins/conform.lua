return {
    'stevearc/conform.nvim',
    keys = {
        {
            '<leader>cf',
            function()
                require('conform').format({ lsp_fallback = true, timeout_ms = 2000 })
            end,
            mode = { 'n', 'v' },
            desc = 'Format (Conform)',
        },
    },
    opts = {
        formatters_by_ft = {
            html = { 'prettier' },
            css = { 'prettier' },
            htmldjango = { 'prettier' },
            javascript = { 'prettier' },
            javascriptreact = { 'prettier' }, -- optional
            typescript = { 'prettier' }, -- optional
            typescriptreact = { 'prettier' }, -- optional
            python = { 'black' },
            sh = { 'shfmt' },
            bash = { 'shfmt' },
            rust = { 'rustfmt' },
            c = { 'clang-format' },
            cpp = { 'clang-format' },
            json = { 'prettier' },
            toml = { 'taplo' },
        },
        formatters = {
            rustfmt = {
                command = 'rustup',
                args = { 'run', 'nightly', 'rustfmt', '--edition', '2024' },
                stdin = true,
            },
            ["clang-format"] = {
                prepend_args = function()
                    local editorconfig = vim.fn.findfile(".editorconfig", ".;")
                    if editorconfig ~= "" then
                        local sw = vim.bo.shiftwidth
                        local use_tab = not vim.bo.expandtab
                        local style = string.format(
                            "{BasedOnStyle: LLVM, IndentWidth: %d, UseTab: %s, ColumnLimit: 80}",
                            sw,
                            use_tab and "Always" or "Never"
                        )
                        return { "--style", style }
                    end
                    return {}
                end,
            },
        },
    },
}
