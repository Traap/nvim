require("config.traap.globals")

local plugin = "telescope-fzf-native.nvim"

return {
  "nvim-telescope/" .. plugin,
  enabled = Is_Enabled(plugin),
  cmd = "Telescope",
  build = "make",
  config = function()
    require("telescope").load_extension("fzf")
  end,
}
