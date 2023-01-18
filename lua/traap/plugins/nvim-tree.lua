return {
  {
    'kyazdani42/nvim-tree.lua',
    cmd = 'NvimTreeToggle',
    opts = {
      filters = {
        custom = { '.git' },
      },
      view = {
        side = 'right',
        width = 30,
      },
    },
  },
}
