Customize = require("config.customize")
Constants = require("config.constants")
Is_Enabled = require("config.functions").is_enabled

return {

  -- {{{ nvim-dap
  {
    "mfussenegger/nvim-dap",
    enabled = Is_Enabled("nvim-dap"),
    event = Constants.file_types,
  },

  -- ----------------------------------------------------------------------- }}}
  -- {{{ nvim-dap-ui

  {
    "rcarriga/nvim-dap-ui",
    enabled = Is_Enabled("nvim-dap-ui"),
    event = Constants.file_types,
    opts = {
      controls = {
        element = "repl",
        enabled = true,
        icons = {
          disconnect = "",
          pause = "",
          play = "",
          run_last = "",
          step_back = "",
          step_into = "",
          step_out = "",
          step_over = "",
          terminate = "",
        },
      },
      element_mappings = {},
      expand_lines = true,
      floating = {
        border = "single",
        mappings = {
          close = { "q", "<Esc>" },
        },
      },
      force_buffers = true,
      icons = {
        collapsed = "",
        current_frame = "",
        expanded = "",
      },
      layouts = {
        {
          elements = {
            {
              id = "scopes",
              size = 0.25,
            },
            {
              id = "breakpoints",
              size = 0.25,
            },
            {
              id = "stacks",
              size = 0.25,
            },
            {
              id = "watches",
              size = 0.25,
            },
          },
          position = "right",
          size = 40,
        },
        {
          elements = {
            {
              id = "repl",
              size = 0.5,
            },
            {
              id = "console",
              size = 0.5,
            },
          },
          position = "bottom",
          size = 10,
        },
      },
      mappings = {
        edit = "e",
        expand = { "<CR>", "<2-LeftMouse>" },
        open = "o",
        remove = "d",
        repl = "r",
        toggle = "t",
      },
      render = {
        indent = 1,
        max_value_lines = 100,
      },
    },

    dependencies = { "mfussenegger/nvim-dap" },
  },

  -- ----------------------------------------------------------------------- }}}
  -- {{{ nvim-dap-virtual-text

  {
    "theHamsta/nvim-dap-virtual-text",
    enabled = Is_Enabled("nvim-dap-virtual-text"),
    event = Constants.file_types,
    config = true,
    dependencies = { "mfussenegger/nvim-dap" },
  },

  -- ------------------------------------------------------------------------ }}}
  -- {{{ one-small-step-for-vimkind

  {
    "jbyuki/one-small-step-for-vimkind",
    enabled = Is_Enabled("one-small-step-for-vimkind"),
    event = "BufEnter *.lua",
    config = true,
    dependencies = { "mfussenegger/nvim-dap" },
  },

  -- ------------------------------------------------------------------------ }}}
  -- {{{ telescope-dap.nvim

  {
    "nvim-telescope/telescope-dap.nvim",
    enabled = Is_Enabled("telescope-dap.nvim"),
    event = Constants.file_types,
    config = true,
    dependencies = { "mfussenegger/nvim-dap" },
  },

  -- ------------------------------------------------------------------------ }}}
  -- {{{ crates.nvim

  {
    "saecki/crates.nvim",
    enabled = Is_Enabled("crates.nvim"),
    event = "BufEnter *.rs",
    opts = {
      null_ls = {
        name = "crates.nvim",
      },
      popup = {
        border = "rounded",
      },
    },
    dependencies = { "mfussenegger/nvim-dap" },
  },

  -- ------------------------------------------------------------------------ }}}
  -- {{{ nvim-dap-go

  {
    "leoluz/nvim-dap-go",
    enabled = Is_Enabled("nvim-dap-go"),
    event = "BufEnter *.rb",
    opts = {
      dap_configurations = {
        {
          type = "go",
          name = "Attach remote",
          mode = "remote",
          request = "attach",
        },
      },
      delve = {
        initialize_timeout_sec = 20,
        port = "${port}",
      },
    },
    dependencies = { "mfussenegger/nvim-dap" },
  },

  -- ----------------------------------------------------------------------- }}}
  -- {{{ nvim-dap-python

  {
    "mfussenegger/nvim-dap-python",
    enabled = Is_Enabled("nvim-dap-python"),
    event = "BufEnter *.py",
    dependencies = { "mfussenegger/nvim-dap" },
  },

  -- ----------------------------------------------------------------------- }}}
  -- {{{ nvim-dap-ruby

  {
    "suketa/nvim-dap-ruby",
    enabled = Is_Enabled("nvim-dap-ruby"),
    event = "BufEnter *.rb",
    config = true,
    dependencies = { "mfussenegger/nvim-dap" },
  },

  -- ----------------------------------------------------------------------- }}}
}
