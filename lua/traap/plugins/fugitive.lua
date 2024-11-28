return {
  "tpope/vim-fugitive",
  -- lazy = false,
  -- event = "VeryLazy",
  enabled = true,

  cmd = "G",

  keys = {
    {"<leader>gP", "<cmd>G pull<cr>"},
    {"<leader>gd", "<cmd>G diff<cr>"},
    {"<leader>gl", "<cmd>G log<cr>"},
    {"<leader>gh", "<cmd>vert bo help fugitive<cr>"},
    {"<leader>gp", "<cmd>G push<cr>"},
    {"<leader>gs", "<cmd>G<cr>"},
    {"gh", "<cmd>diffget //2<cr>"}, -- Chose left side,
    {"gl", "<cmd>diffget //3<cr>"}, -- Chose right size
  },
}
