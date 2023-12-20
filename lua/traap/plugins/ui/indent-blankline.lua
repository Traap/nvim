return {
  "lukas-reineke/indent-blankline.nvim",

  event = { "BufReadPost", "BufNewFile" },
  enabled = true,

  main = "ibl",

  opts = {
    indent = {
      char = "│",
      tab_char = "│",
    },

    scope = { enabled = false },

    exclude = {

      filetypes = {
        "help",
        "alpha",
        "dashboard",
        "neo-tree",
        "Trouble",
        "lazy",
        "mason",
      }
    }
  }
}

