return {
	"L3MON4D3/LuaSnip",
  enabled = true,
  event = {"BufReadPost", "BufNewFile"},
  dependencies = {
    "hrsh7th/nvim-cmp",
    "saadparwaiz1/cmp_luasnip",
  },
	version = "v2.*",
	build = "make install_jsregexp"
}
