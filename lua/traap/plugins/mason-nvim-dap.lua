require("traap.core.globals")

local plugin = "mason-nvim-dap.nvim"

return {
  "jay-babu/" .. plugin,
  enabled = Is_Enabled(plugin),
  event = Constants.file_types,
  opts = function(_, opts)
    if Use_Default_Opts(plugin) then
      opts = opts
    else
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
    end
  end,
}
