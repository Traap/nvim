return {
  "lukas-reineke/indent-blankline.nvim",
  enabled = false,
  event = "VeryLazy",
  opts = function()
    -- LazyVim.toggle.map("<leader>ug", {
    --   name = "Indention Guides",
    --   get = function()
    --     return require("ibl.config").get_config(0).enabled
    --   end,
    --   set = function(state)
    --     require("ibl").setup_buffer(0, { enabled = state })
    --   end,
    -- })

    return {
      indent = {
        char = "│",
        tab_char = "│",
      },
      scope = { show_start = false, show_end = false },
      exclude = {
        filetypes = {
          "help",
          "alpha",
          "dashboard",
          "neo-tree",
          "Trouble",
          "trouble",
          "lazy",
          "mason",
          "notify",
          "toggleterm",
          "lazyterm",
        },
      },
    }
  end,
  main = "ibl"
}
