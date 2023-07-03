require("config.globals")

local plugin = "tokyonight.nvim"

return {
  "folke/" .. plugin,
  enabled = Is_Enabled(plugin),
  lazy = false,
  opts = function(_, opts)
    if Use_Default_Opts(plugin) then
      opts = opts
    else
      opts.style = "night"
      opts.styles = { sidebars = "transparent", floats = "transparent", }
    end
  end,
}
