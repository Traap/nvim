Constants = require("config.constants")
Customize = require("config.customize")
Is_Enabled = require("config.functions").is_enabled

-- {{{ nvim-cmp

local plugin = "nvim-cmp"

return {
  "hrsh7th/" .. plugin,
  event = "InsertEnter",
  enabled = Is_Enabled(plugin),
  opts = require("plugins.opts." .. plugin),
  dependencies = {
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-calc",
    "hrsh7th/cmp-cmdline",
    "hrsh7th/cmp-nvim-lua",
    "hrsh7th/cmp-nvim-lsp-document-symbol",
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-path",
    "f3fora/cmp-spell",
    "saadparwaiz1/cmp_luasnip",
  }
}
-- ------------------------------------------------------------------------- }}}
