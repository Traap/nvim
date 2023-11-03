require("config.traap.globals")

local plugin = "toggleterm.nvim"

return {
  "akinsho/" .. plugin,
  enabled = Is_Enabled(plugin),
  version = "*",
  opts = {
    size = 13,
    open_mapping = [[<c-\>]],
    shade_filetypes = {},
    shade_terminals = true,
    shading_factor = "1",
    start_in_insert = true,
    persist_size = true,
    direction = "horizontal",
  },
  keys = {
    {"<leader>Tb", "<cmd>lua ToggleTerm.bashtop()<cr>", "Bashtop"},
    {"<leader>Tl", "<cmd>lua ToggleTerm.lazygit()<cr>", "LazyGit"},
    {"<leader>Tm", "<cmd>lua ToggleTerm.neomutt()<cr>", "Neomutt"},
    {"<leader>Tr", "<cmd>lua ToggleTerm.ranger()<cr>", "Ranger"},
  },
}
