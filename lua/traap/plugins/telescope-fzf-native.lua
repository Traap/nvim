return {
  "nvim-telescope/telescope-fzf-native.nvim",
  dependencies = {
    "nvim-telescope/telescope.nvim",
  },

  enabled = true,
  build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build",
  cond = vim.fn.executable("cmake") == 1,

  config = function ()
    pcall(require("telescope").load_extension, "fzf")
  end,
}
