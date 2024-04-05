local keywords = 'YouTube,Youtube,URL,Url'

return {
  "folke/todo-comments.nvim",
  enabled = true,
  event = {"BufReadPost", "BufNewFile"},

  keys = {
    {"<leader>fy", "<cmd>TodoTelescope keywords="..keywords.."<cr>"},
  },

  opts = function(_, opts)
    opts.merge_keywords = true
    opts.keywords = {
      YouTube = { icon = " ", color = "#ff0000", alt = {"youtube", "Youtube"}},
      URL = { icon = " ", color = "#7711FF", alt = { "Url", "url" } },
    }
  end,

}
