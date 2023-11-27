return {
  "williamboman/mason.nvim",
  enable = true,
  keys = {
    { "<leader>pm", "<cmd>Mason<cr>", "Mason toggle" },
  },

  config = function()
    require("mason").setup({
      ui = {
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗"
        },
        border = "rounded",
      },
    })
  end,
}
