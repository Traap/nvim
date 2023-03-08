Customize = require("config.customize")
Constants = require("config.constants")
Is_Enabled = require("config.functions").is_enabled

return {

  -- {{{ nvim-dap
  {
    "mfussenegger/nvim-dap",
    enabled = Is_Enabled("nvim-dap"),
    ft = { "c", "cpp", "go", "py", "rb" },

    config = function()
      require("dapui").setup()
      require("nvim-dap-virtual-text").setup()
      -- require("telescope-dap").setup()
    end,

    dependencies = {
      "jbyuki/one-small-step-for-vimkind",
      "nvim-telescope/telescope-dap.nvim",
      "rcarriga/nvim-dap-ui",
      "theHamsta/nvim-dap-virtual-text",
    },
  },

  -- ----------------------------------------------------------------------- }}}
  -- {{{ nvim-dap-ui

  {
    "rcarriga/nvim-dap-ui",
    enabled = Is_Enabled("nvim-dap-ui"),
    ft = { "go", "py", "rb" },
    config = true,
  },

  -- ----------------------------------------------------------------------- }}}
  -- {{{ nvim-dap-virtual-text

  {
    "theHamsta/nvim-dap-virtual-text",
    enabled = Is_Enabled("nvim-dap-virtual-text"),
    ft = { "go", "py", "rb" },
    config = true,
  },

  -- ------------------------------------------------------------------------ }}}
  -- {{{ telescope-dap.nvim

  {
    "nvim-telescope/telescope-dap.nvim",
    enabled = Is_Enabled("telescope-dap.nvim"),
    ft = { "go", "py", "rb" },
    config = true,
  },

  -- ------------------------------------------------------------------------ }}}
  -- {{{ crates.nvim

  {
    "saecki/crates.nvim",
    enabled = Is_Enabled("crates.nvim"),
    dependencies = { "mfussenegger/nvim-dap" },
    event = "VeryLazy",
    ft = { "rs" },
    opts = {
      null_ls = {
        name = "crates.nvim",
      },
      popup = {
        border = "rounded",
      },
    },
  },

  -- ------------------------------------------------------------------------ }}}
  -- {{{ nvim-dap-go

  {
    "leoluz/nvim-dap-go",
    enabled = Is_Enabled("nvim-dap-go"),
    dependencies = { "mfussenegger/nvim-dap" },
    event = "VeryLazy",
    ft = { "go" },
    config = true,
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
  },

  -- ----------------------------------------------------------------------- }}}
  -- {{{ nvim-dap-python

  {
    "mfussenegger/nvim-dap-python",
    enabled = Is_Enabled("nvim-dap-python"),
    dependencies = { "mfussenegger/nvim-dap" },
    event = "VeryLazy",
    ft = { "py" },
  },

  -- ----------------------------------------------------------------------- }}}
  -- {{{ nvim-dap-ruby

  {
    "suketa/nvim-dap-ruby",
    enabled = Is_Enabled("nvim-dap-ruby"),
    dependencies = { "mfussenegger/nvim-dap" },
    event = "VeryLazy",
    ft = { "rb" },
    config = true,
  },

  -- ----------------------------------------------------------------------- }}}
}
