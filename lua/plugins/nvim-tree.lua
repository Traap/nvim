require("config.globals")

local plugin = "nvim-tree"

return {
  "kyazdani42/" .. plugin,
  enabled = Is_Enabled(plugin),
  cmd = { "NvimTreeFindFile", "NvimTreeRefresh", "NvimTreeToggle", },
  opts = function(_, opts)
    if Use_Defaults(plugin) then
      opts = opts
    else
      opts.filters = { custom = { ".git" }, }
      opts.view = { side = "right", width = 30, }
    end
  end,
}
