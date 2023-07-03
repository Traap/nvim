require("config.globals")

local plugin = "mini.pairs"

return {
  "echasnovski/" .. plugin,
  enabled = Is_Enabled(plugin),
  opts = function(_, opts)
    if Use_Default_Opts(plugin) then
      opts = opts
    else
      opts = {}
    end
  end,
}
