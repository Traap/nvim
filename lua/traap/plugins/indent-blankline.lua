require("traap.core.globals")

local plugin = 'indent-blankline'

return {
  "lukas-reineke/" .. plugin .. ".nvim",

  event = { "BufReadPost", "BufNewFile" },
  enabled = Is_Enabled(plugin),

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

