require("config.globals")

local plugin = "dressing.nvim"

return {
  "stevearc/" .. plugin,
  enabled = Is_Enabled(plugin),
  opts = function(_, opts)
    if Use_Default_Opts(plugin) then
      opts = opts
    else
      opts = {}
    end
  end,
}
