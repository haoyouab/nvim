return {
    'stevearc/aerial.nvim',
    keys = {
        { '<C-x>', '<cmd>AerialToggle<cr>', desc = 'Aerial (Symbols)' },
    },
    opts = {
        backends = { 'treesitter', 'lsp', 'markdown', 'asciidoc', 'man' },
        layout = {
            -- These control the width of the aerial window.
            -- They can be integers or a float between 0 and 1 (e.g. 0.4 for 40%)
            -- min_width and max_width can be a list of mixed types.
            -- max_width = {40, 0.2} means "the lesser of 40 columns or 20% of total"
            max_width = { 50, 0.5 },
            width = nil,
            min_width = 20,

            -- key-value pairs of window-local options for aerial window (e.g. winhl)
            win_opts = {},

            -- Determines the default direction to open the aerial window. The 'prefer'
            -- options will open the window in the other direction *if* there is a
            -- different buffer in the way of the preferred direction
            -- Enum: prefer_right, prefer_left, right, left, float
            default_direction = 'prefer_left',

            -- Determines where the aerial window will be opened
            --   edge   - open aerial at the far right/left of the editor
            --   window - open aerial to the right/left of the current window
            placement = 'window',

            -- When the symbols change, resize the aerial window (within min/max constraints) to fit
            resize_to_content = true,

            -- Preserve window size equality with (:help CTRL-W_=)
            preserve_equality = false,
        },
        disable_max_lines = 20000,
        close_automatic_events = { 'unsupported' },
        nerd_font = 'auto',
    },
}
