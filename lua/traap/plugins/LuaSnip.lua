return {
  "L3MON4D3/LuaSnip",
  enabled = true,
  event = "VeryLazy",
  dependencies = {
    "hrsh7th/nvim-cmp",
    "saadparwaiz1/cmp_luasnip",
  },
  build = "make install_jsregexp"
}
