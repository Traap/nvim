require("config.traap.globals")

local plugin = "nvim-navic"

return {
  "SmiteshP/" .. plugin,
  enabled = Is_Enabled(plugin),
  opts = function(_, opts)
    if Use_Default_Opts(plugin) then
      opts = opts
    else
      opts = {}
    end
  end,
}
