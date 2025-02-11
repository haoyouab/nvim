return {
    'akinsho/bufferline.nvim',
    version = '*',
    dependencies = 'nvim-tree/nvim-web-devicons',

    opts = {
        options = {
            themable = true,
            numbers = 'buffer_id',
            offsets = {
                filetype = 'Outline',
                text = 'Symbols Outline',
                text_align = 'left',
                separator = true,
            },
            separator_style = 'slope',
            show_duplicate_prefix = true,
            always_show_bufferline = true,
            tab_size = 18,
            highlights = {
                fill = {
                    fg = '#87d7af',
                    bg = '#87d7af',
                },
                background = {
                    fg = '#87d7af',
                    bg = '#87d7af',
                },
                tab = {
                    fg = '#87d7af',
                    bg = '#87d7af',
                },
                tab_selected = {
                    fg = '#87d7af',
                    bg = '#87d7af',
                },
                tab_separator = {
                    fg = '#87d7af',
                    bg = '#87d7af',
                },
                close_button = {
                    fg = '#87d7af',
                    bg = '#87d7af',
                },
            },
        },
    },
}
