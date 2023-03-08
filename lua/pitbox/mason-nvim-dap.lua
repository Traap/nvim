  -- {{{ mason-nvim-dap.nvim

  {
    "jay-babu/mason-nvim-dap.nvim",
    cmd = "Mason",
    enabled = Is_Enabled("mason-nvim-dap.nvim"),
    opts = {
      automatic_setup = true,
      ensure_installed = {
        "codelldb",
        "debugpy",
        "delve",
        "java-debug-adapter",
        "java-test",
        "js-debug-adapter",
        "netconfigdb",
        "node-debug2-adapter",
      },
    },
  },

  -- ----------------------------------------------------------------------- }}}
