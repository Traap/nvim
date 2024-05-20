return {
  "nvim-telescope/telescope-fzf-native.nvim",
  enabled = true,

  build = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build',

  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope.nvim",
  },

  config = function()
    require("telescope").load_extension("fzf")
  end,
}
