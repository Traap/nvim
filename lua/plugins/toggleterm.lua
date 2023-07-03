require("config.globals")

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
    {
      "<leader>Tf",
      "<leader>Tl",
      "<leader>Tr",
    },
  },
}
