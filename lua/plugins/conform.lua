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
        },
        formatters = {
            rustfmt = {
                command = 'rustup',
                args = { 'run', 'nightly', 'rustfmt', '--edition', '2024' },
                stdin = true,
            },
        },
    },
}
