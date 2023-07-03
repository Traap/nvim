require("config.globals")

local plugin = "flit.nvim"

return {
  "ggandor/" .. plugin,
  enabled = Is_Enabled(plugin),
  opts = function(_, opts)
    if Use_Defaults(plugin) then
      opts = opts
    else
      opts = {}
    end
  end,
}
