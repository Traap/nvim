require("config.traap.globals")

local plugin = "LuaSnip"

return {
  "L3MON4D3/" .. plugin,
  enabled = Is_Enabled(plugin),
  opts = function(_, opts)
    if Use_Default_Opts(plugin) then
      opts = opts
    else
      opts = {}
    end
  end,
  -- keys = function()
  --   return {}
  -- end
}
