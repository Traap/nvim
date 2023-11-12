require("traap.core.globals")

local plugin = "nvim-navic"

return {
  "SmiteshP/" .. plugin,
  enabled = Is_Enabled(plugin),
  opts = function(_, opts)
    opts = {
      lsp = { auto_attach = true, },

    }
  end,

  config = function(_, opts)
    require(plugin).setup(opts)
  end,
}
