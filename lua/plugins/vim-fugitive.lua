return {
  "tpope/vim-fugitive",
  enabled = true,

  cmd = "G",

  keys = {
    {"<leader>gP", "<cmd>G pull<cr>"},
    {"<leader>gc", "<cmd>G commmit<cr>"},
    {"<leader>gd", "<cmd>G diff<cr>"},
    {"<leader>gl", "<cmd>G log<cr>"},
    {"<leader>gh", "<cmd>vert bo help fugitive<cr>"},
    {"<leader>gp", "<cmd>G push<cr>"},
    {"<leader>gs", "<cmd>G<cr>"},
    {"gl", "<cmd>diffget //2<cr>"}, -- Chose left side,
    {"gh", "<cmd>diffget //3<cr>"}, -- Chose right size
  },
}

