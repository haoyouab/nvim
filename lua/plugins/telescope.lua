return {
    'nvim-telescope/telescope.nvim',
    keys = {
      -- add a keymap to browse plugin files
      -- stylua: ignore
      {
        "<leader>fh",  "<cmd>Telescope find_files no_ignore=true hidden=true<cr>", desc = "Find Hidden File",
      },
        { '<leader>/', LazyVim.pick('live_grep', { root = false }), desc = 'Grep (cwd)' },
        { '<leader><space>', LazyVim.pick('files', { root = false }), desc = 'Find Files (cwd)' },
    },
    -- change some options
    opts = {
        defaults = {
            layout_strategy = 'horizontal',
            layout_config = { prompt_position = 'top' },
            sorting_strategy = 'ascending',
            winblend = 0,
        },
        pickers = {
      buffers = {
        mappings = {
          i = {
            ["<c-d>"] = "delete_buffer",
          }
        }
      }
    }
    },
}
