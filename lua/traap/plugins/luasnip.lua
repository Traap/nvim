require("traap.core.globals")

local plugin = "LuaSnip"

return {
  "L3MON4D3/" .. plugin,
  enabled = Is_Enabled(plugin),
  build = "make install_jsregexp",
}
