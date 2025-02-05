return {
    'nvim-neo-tree/neo-tree.nvim',
    keys = { { '<C-n>', '<cmd>Neotree toggle<cr>', desc = 'Neotree toggle' } },
    opts = {
        close_if_last_window = true,
        window = {
            position = 'right',
        },
    },
}
