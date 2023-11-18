return {
  "jay-babu/mason-nvim-dap.nvim",
  enabled = true,
  event = Constants.file_types,
  opts = function(_, opts)
    opts.automatic_setup = true
    opts.ensure_installed = {
      "codelldb",
      "debugpy",
      "delve",
      "java-debug-adapter",
      "java-test",
      "js-debug-adapter",
      "netconfigdb",
      "node-debug2-adapter",
    }
  end,
}
