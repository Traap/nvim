require("config.globals")

local plugin = "mini.surround"

return {
  "echasnovski/" .. plugin,
  enabled = Is_Enabled(plugin),
  opts = function(_, opts)
    if Use_Defaults(plugin) then
      opts = opts
    else
      opts = {}
    end
  end,
}
