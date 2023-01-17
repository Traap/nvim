return {
  {
    "kyazdani42/nvim-tree.lua",
    event = 'BufEnter',
    opts = {
      filters = {
        custom = { ".git" },
      },
      view = {
        side = "right",
        width = 30,
      },
    },
  },
}
