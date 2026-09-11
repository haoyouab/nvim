-- TypeScript / JavaScript tweaks on top of lazyvim.plugins.extras.lang.typescript
-- (vtsls LSP, js-debug-adapter, tsx/typescript treesitter) and extras.linting.eslint.
return {
    -- prettier is used by conform.nvim for ts/tsx/js/jsx (see conform.lua)
    {
        'mason-org/mason.nvim',
        opts = { ensure_installed = { 'prettier' } },
    },

    {
        'neovim/nvim-lspconfig',
        -- append instead of assigning `servers.vtsls.keys`: a plain opts table would
        -- overwrite the keymaps the typescript extra defines (gD, gR, <leader>cM/cD/cV)
        opts = function(_, opts)
            local vtsls = opts.servers.vtsls or {}
            opts.servers.vtsls = vtsls
            vtsls.keys = vtsls.keys or {}
            vim.list_extend(vtsls.keys, {
                {
                    '<leader>co',
                    LazyVim.lsp.action['source.organizeImports'],
                    desc = 'Organize Imports',
                },
                {
                    '<leader>cu',
                    LazyVim.lsp.action['source.removeUnused.ts'],
                    desc = 'Remove Unused Imports',
                },
            })
        end,
    },
}
