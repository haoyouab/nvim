return {
    'akinsho/toggleterm.nvim',
    version = '*',
    keys = {
        { [[<C-\>]], desc = 'Toggle Terminal' },
    },
    opts = {
        size = 20,
        open_mapping = [[<c-\>]],
        hide_numbers = true,
        shade_terminals = true,
        shading_factor = 2,
        start_in_insert = true,
        insert_mappings = true,
        persist_size = true,
        direction = 'float',
        close_on_exit = true,
        shell = vim.o.shell,
        float_opts = {
            border = 'curved',
            winblend = 0,
            highlights = {
                border = 'Normal',
                background = 'Normal',
            },
        },
    },
    config = function(_, opts)
        require('toggleterm').setup(opts)

        vim.api.nvim_create_autocmd('TermOpen', {
            pattern = 'term://*',
            callback = function()
                local kopts = { noremap = true, buffer = 0 }
                vim.keymap.set('t', '<esc><esc>', [[<C-\><C-n>]], kopts)
            end,
        })

        local Terminal = require('toggleterm.terminal').Terminal

        local lazygit = Terminal:new({ cmd = 'lazygit', hidden = true })
        function _G._LAZYGIT_TOGGLE()
            lazygit:toggle()
        end

        local node = Terminal:new({ cmd = 'node', hidden = true })
        function _G._NODE_TOGGLE()
            node:toggle()
        end

        local python = Terminal:new({ cmd = 'python3', hidden = true })
        function _G._PYTHON_TOGGLE()
            python:toggle()
        end
    end,
}
