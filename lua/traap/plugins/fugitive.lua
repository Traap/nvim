local EVENT = nil
if pcall(require, "lazyvim") then
  EVENT = 'VeryLazy'
else
  EVENT = { "BufReadPost", "BufNewFile", "BufWritePre" }
end

return {
  "tpope/vim-fugitive",
  dependencies = {
    "tpope/vim-rhubarb"
  },

  enabled = true,
  event = EVENT,
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
