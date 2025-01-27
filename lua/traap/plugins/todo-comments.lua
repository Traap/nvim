local keywords = 'YouTube,Youtube,URL,Url'

return {
  "folke/todo-comments.nvim",
  enabled = true,
  event = require("traap.config.events").file,

  keys = {
    {"<leader>fy", "<cmd>Find Todo keywords="..keywords.."<cr>"},
  },

  opts = function(_, opts)
    opts.merge_keywords = true
    opts.keywords = {
      YouTube = { icon = " ", color = "#ff0000", alt = {"youtube", "Youtube"}},
      URL = { icon = " ", color = "#7711FF", alt = { "Url", "url" } },
    }
  end,

}
