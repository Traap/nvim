return {
  -- {{{ nvim-dap

  { 'mfussenegger/nvim-dap',
    ft = {'rb', 'rs'},
    dependencies = {
      'rcarriga/nvim-dap-ui',
      'theHamsta/nvim-dap-virtual-text',
    },
  },

  -- ----------------------------------------------------------------------- }}}
  -- {{{ nvim-dap-ui

  {
    'rcarriga/nvim-dap-ui',
    ft = {'rb', 'rs'},
    keys = '<leader>dU',
    opts = {
      expand_lines = true,

      icons = {
        expanded = "",
        collapsed = "",
        circular = ""
      },

      mappings = {
        expand = { "<CR>", "<2-LeftMouse>" },
        open = "o",
        remove = "d",
        edit = "e",
        repl = "r",
        toggle = "t",
      },

      layouts = {
        {
          elements = {
            { id = "scopes", size = 0.33 },
            { id = "breakpoints", size = 0.17 },
            { id = "stacks", size = 0.25 },
            { id = "watches", size = 0.25 },
          },
          size = 0.33,
          position = "right",
        },
        {
          elements = {
            { id = "repl", size = 0.50 },
            { id = "console", size = 0.50 },
          },
          size = 0.25,
          position = "bottom",
        },
      },

      floating = {
        max_height = 0.9,
        max_width = 0.5,
        border = vim.g.border_chars,
        mappings = {
          close = { "q", "<Esc>" },
        },
      },
    }
  },

  -- ----------------------------------------------------------------------- }}}
  -- {{{ nvim-dap-virtual-text

  {
    'theHamsta/nvim-dap-virtual-text',
     opts = {
      enabled = true,
      enabled_commands = false,
      highlight_changed_variables = true,
      highlight_new_as_changed = true,
      commented = false,
      show_stop_reason = true,
      virt_text_pos = "eol",
      all_frames = false,
    },
 },

 -- ------------------------------------------------------------------------ }}}
  -- {{{ rust

  { 'simrat39/rust-tools.nvim',
    ft = 'rs',
    config = true,
    dependencies = {
      'saecki/crates.nvim',
      'nvim-lua/plenary.nvim',
    },
  },

  { 'saecki/crates.nvim',
    ft = 'rs',
    opts = {
      null_ls = {
        enabled = true,
        name = 'crates.nvim'
      },
      popup = {
        border = 'rounded',
      },
    },
  },

 -- ------------------------------------------------------------------------ }}}
}
