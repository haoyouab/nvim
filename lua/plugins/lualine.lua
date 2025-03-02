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
            ignore_focus = {},
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
            lualine_c = {
                { 'filename', path = 3 },
            },
            -- lualine_x = { 'encoding', 'fileformat', 'filetype' },
            lualine_x = {},
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
            lualine_c = { 'filename' },
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
                    max_length = vim.o.columns * 9 / 10,
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
        winbar = {},
        inactive_winbar = {},
        extensions = {
            'aerial',
            'neo-tree',
            'toggleterm',
            'lazy',
        },
    },
}
