return {
    'coder/claudecode.nvim',
    dependencies = { 'folke/snacks.nvim' },
    cmd = {
        'ClaudeCode',
        'ClaudeCodeFocus',
        'ClaudeCodeOpen',
        'ClaudeCodeClose',
        'ClaudeCodeSend',
        'ClaudeCodeAdd',
        'ClaudeCodeTreeAdd',
        'ClaudeCodeStatus',
        'ClaudeCodeStart',
        'ClaudeCodeStop',
        'ClaudeCodeDiffAccept',
        'ClaudeCodeDiffDeny',
        'ClaudeCodeSelectModel',
    },
    keys = {
        { '<leader>ac', '<cmd>ClaudeCode<cr>', desc = 'Toggle Claude' },
        { '<leader>af', '<cmd>ClaudeCodeFocus<cr>', desc = 'Focus Claude' },
        { '<C-q>', '<cmd>ClaudeCode<cr>', mode = { 'n', 't' }, desc = 'Toggle Claude' },
        { '<leader>as', '<cmd>ClaudeCodeSend<cr>', mode = 'v', desc = 'Send to Claude' },
        { '<leader>at', '<cmd>ClaudeCodeTreeAdd<cr>', desc = 'Add file to Claude' },
        { '<leader>ab', '<cmd>ClaudeCodeAdd %<cr>', desc = 'Add current buffer' },
        { '<leader>am', '<cmd>ClaudeCodeSelectModel<cr>', desc = 'Select Claude model' },
        { '<leader>ay', '<cmd>ClaudeCodeDiffAccept<cr>', desc = 'Accept diff' },
        { '<leader>an', '<cmd>ClaudeCodeDiffDeny<cr>', desc = 'Deny diff' },
    },
    opts = {
        terminal_cmd = vim.fn.executable('cfuse') == 1 and 'cfuse' or 'claude',
        terminal = {
            split_side = 'right',
            split_width_percentage = 0.4,
            provider = 'snacks',
            snacks_win_opts = {
                keys = {
                    term_normal = false, -- disable <Esc><Esc> to avoid sending Esc to Claude CLI
                },
            },
        },
    },
}
