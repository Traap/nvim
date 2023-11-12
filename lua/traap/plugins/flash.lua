require("traap.core.globals")

local plugin = "flash.nvim"

return {
  "folke/" .. plugin,
  enabled = Is_Enabled(plugin),
  event = "VeryLazy",
  vscode = true,
  opts = function(_, opts)
    if Use_Default_Opts(plugin) then
      opts = opts
    else
      opts = {}
    end
  end,
}
