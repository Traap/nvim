Customize = require("config.customize")
Is_Enabled = require("config.functions").is_enabled

local plugin = "nvim-cmp"

return {
  "hrsh7th/" .. plugin,
  event = {"InsertEnter"},
  enabled = Is_Enabled(plugin),
  opts = function(_, opts)
    if Use_Defaults(plugin) then
      opts = opts
    else
      opts = require("plugins.opts." .. plugin)
    end
  end,

  dependencies = {
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-calc",
    "hrsh7th/cmp-cmdline",
    "hrsh7th/cmp-path",
    "f3fora/cmp-spell",
    "hrsh7th/cmp-nvim-lua",
    "hrsh7th/cmp-nvim-lsp-document-symbol",
    "hrsh7th/cmp-nvim-lsp",
    "saadparwaiz1/cmp_luasnip",
  }
}
