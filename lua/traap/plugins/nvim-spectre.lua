return {
  "nvim-pack/nvim-spectre",
  event = { "BufReadPost", "BufNewFile" },
  enabled = true,
  keys = {
    {
      "<leader>sr",
      function()
        require("spectre").open()
      end,
      desc = "Replace in files (Spectre)",
    },
  },
}
