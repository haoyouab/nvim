return {
  {
    'jay-babu/mason-nvim-dap.nvim',
    opts = {
      ensure_installed = { 'codelldb', 'cppdbg' },
    },
  },

  {
    'mfussenegger/nvim-dap',
    keys = {
      { '<F5>', function() require('dap').continue() end, desc = 'Debug: Continue' },
      { '<F9>', function() require('dap').toggle_breakpoint() end, desc = 'Debug: Toggle Breakpoint' },
      { '<F10>', function() require('dap').step_over() end, desc = 'Debug: Step Over' },
      { '<F11>', function() require('dap').step_into() end, desc = 'Debug: Step Into' },
      { '<S-F11>', function() require('dap').step_out() end, desc = 'Debug: Step Out' },
      { '<F6>', function() require('dap').terminate() end, desc = 'Debug: Terminate' },
      {
        '<leader>dL',
        function()
          require('dap').set_breakpoint(nil, nil, vim.fn.input('Log point message: '))
        end,
        desc = 'Debug: Log Point',
      },
    },
    config = function()
      local dap = require('dap')

      -- Manually register cppdbg adapter (cpptools installed from local vsix)
      dap.adapters.cppdbg = {
        id = 'cppdbg',
        type = 'executable',
        command = vim.fn.stdpath('data') .. '/mason/packages/cpptools/extension/debugAdapters/bin/OpenDebugAD7',
      }

      local cppdbg_configs = {
        {
          name = 'GDB: Launch file',
          type = 'cppdbg',
          request = 'launch',
          program = function()
            return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
          end,
          cwd = '${workspaceFolder}',
          stopAtEntry = false,
          MIMode = 'gdb',
          miDebuggerPath = vim.fn.stdpath('config') .. '/scripts/sudo-gdb.sh',
          setupCommands = {
            { text = '-enable-pretty-printing', description = 'Enable pretty printing', ignoreFailures = false },
          },
        },
        {
          name = 'GDB: Launch with args',
          type = 'cppdbg',
          request = 'launch',
          program = function()
            return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
          end,
          args = function()
            local args_str = vim.fn.input('Arguments: ')
            return vim.split(args_str, ' +')
          end,
          cwd = '${workspaceFolder}',
          stopAtEntry = false,
          MIMode = 'gdb',
          miDebuggerPath = vim.fn.stdpath('config') .. '/scripts/sudo-gdb.sh',
          setupCommands = {
            { text = '-enable-pretty-printing', description = 'Enable pretty printing', ignoreFailures = false },
          },
        },
        {
          name = 'GDB: Attach to process',
          type = 'cppdbg',
          request = 'attach',
          program = function()
            return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
          end,
          processId = require('dap.utils').pick_process,
          MIMode = 'gdb',
          miDebuggerPath = vim.fn.stdpath('config') .. '/scripts/sudo-gdb.sh',
          setupCommands = {
            { text = '-enable-pretty-printing', description = 'Enable pretty printing', ignoreFailures = false },
          },
        },
        {
          name = 'GDB: Attach to gdbserver :1234',
          type = 'cppdbg',
          request = 'launch',
          program = function()
            return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
          end,
          cwd = '${workspaceFolder}',
          MIMode = 'gdb',
          miDebuggerPath = vim.fn.stdpath('config') .. '/scripts/sudo-gdb.sh',
          miDebuggerServerAddress = 'localhost:1234',
          setupCommands = {
            { text = '-enable-pretty-printing', description = 'Enable pretty printing', ignoreFailures = false },
          },
        },
      }

      for _, lang in ipairs({ 'c', 'cpp' }) do
        dap.configurations[lang] = dap.configurations[lang] or {}
        for _, config in ipairs(cppdbg_configs) do
          table.insert(dap.configurations[lang], config)
        end
      end

      -- Better sign column icons
      vim.fn.sign_define('DapBreakpoint', { text = '●', texthl = 'DapBreakpoint', linehl = '', numhl = '' })
      vim.fn.sign_define('DapBreakpointCondition', { text = '◆', texthl = 'DapBreakpointCondition', linehl = '', numhl = '' })
      vim.fn.sign_define('DapLogPoint', { text = '◇', texthl = 'DapLogPoint', linehl = '', numhl = '' })
      vim.fn.sign_define('DapStopped', { text = '▶', texthl = 'DapStopped', linehl = 'DapStoppedLine', numhl = '' })
      vim.fn.sign_define('DapBreakpointRejected', { text = '○', texthl = 'DapBreakpointRejected', linehl = '', numhl = '' })

      -- Highlight for stopped line
      vim.api.nvim_set_hl(0, 'DapStoppedLine', { bg = '#2e4d3d' })
    end,
  },

  {
    'rcarriga/nvim-dap-ui',
    opts = {
      controls = {
        enabled = true,
        element = 'repl',
      },
      layouts = {
        {
          elements = {
            { id = 'scopes', size = 0.4 },
            { id = 'breakpoints', size = 0.15 },
            { id = 'stacks', size = 0.25 },
            { id = 'watches', size = 0.2 },
          },
          position = 'left',
          size = 70,
        },
        {
          elements = {
            { id = 'repl', size = 0.5 },
            { id = 'console', size = 0.5 },
          },
          position = 'bottom',
          size = 18,
        },
      },
    },
  },
}
