return {
    'nvim-lualine/lualine.nvim',
    opts = {
        options = {
            icons_enabled = true,
            theme = 'powerline',
            -- component_separators = { left = '', right = '' },
            -- section_separators = { left = '', right = '' },
            component_separators = { left = '', right = '' },
            section_separators = { left = '', right = '' },

            disabled_filetypes = {
                statusline = {},
                winbar = {},
            },
            ignore_focus = {
                'aerial',
                'neo-tree',
            },
            always_divide_middle = true,
            always_show_tabline = true,
            globalstatus = false,
            refresh = {
                statusline = 100,
                tabline = 100,
                winbar = 100,
            },
        },
        sections = {
            lualine_a = {
                {
                    'mode',
                    separator = { left = '' },
                    right_padding = 2,
                },
            },
            lualine_b = { 'branch', 'diff', 'diagnostics' },
            lualine_c = {},
            lualine_x = { 'encoding', 'fileformat', 'filetype' },
            lualine_y = { 'progress' },
            lualine_z = {
                {
                    'location',
                    separator = { right = '' },
                    left_padding = 2,
                },
            },
        },
        inactive_sections = {
            lualine_a = {},
            lualine_b = {},
            lualine_c = {
                {
                    'filename',
                    path = 1,
                },
                {
                    'aerial',
                    -- The separator to be used to separate symbols in status line.
                    sep = ' ) ',

                    -- The number of symbols to render top-down. In order to render only 'N' last
                    -- symbols, negative numbers may be supplied. For instance, 'depth = -1' can
                    -- be used in order to render only current symbol.
                    depth = nil,

                    -- When 'dense' mode is on, icons are not rendered near their symbols. Only
                    -- a single icon that represents the kind of current symbol is rendered at
                    -- the beginning of status line.
                    dense = false,

                    -- The separator to be used to separate symbols in dense mode.
                    dense_sep = '.',

                    -- Color the symbol icons.
                    colored = true,
                },
            },
            lualine_x = { 'location' },
            lualine_y = {},
            lualine_z = {},
        },
        tabline = {
            lualine_a = {
                {
                    'buffers',
                    mode = 4,
                    separator = { left = '', right = '' },
                    right_padding = 2,
                    filetype_names = {
                        TelescopePrompt = 'Telescope',
                        dashboard = 'Dashboard',
                        packer = 'Packer',
                        fzf = 'FZF',
                        alpha = 'Alpha',
                        aerial = 'Aerial',
                    },
                    max_length = vim.o.columns * 19 / 20,
                },
            },
            lualine_b = {},
            lualine_c = {},
            lualine_x = {},
            lualine_y = {},
            lualine_z = {
                {
                    'tabs',
                    left_padding = 2,
                },
            },
        },
        winbar = {
            lualine_a = {},
            lualine_b = {},
            lualine_c = {
                {
                    'filename',
                    path = 1,
                },
                {
                    'aerial',
                    -- The separator to be used to separate symbols in status line.
                    sep = ' ) ',

                    -- The number of symbols to render top-down. In order to render only 'N' last
                    -- symbols, negative numbers may be supplied. For instance, 'depth = -1' can
                    -- be used in order to render only current symbol.
                    depth = nil,

                    -- When 'dense' mode is on, icons are not rendered near their symbols. Only
                    -- a single icon that represents the kind of current symbol is rendered at
                    -- the beginning of status line.
                    dense = false,

                    -- The separator to be used to separate symbols in dense mode.
                    dense_sep = '.',

                    -- Color the symbol icons.
                    colored = true,
                },
            },
            lualine_x = {},
            lualine_y = {},
            lualine_z = {},
        },

        inactive_winbar = {
            lualine_a = {},
            lualine_b = {},
            lualine_c = {},
            lualine_x = {},
            lualine_y = {},
            lualine_z = {},
        },
        extensions = {
            'aerial',
            'neo-tree',
            'toggleterm',
            'lazy',
        },
    },
}
