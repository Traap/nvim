require("traap.core.globals")

local keywords = 'YouTube,Youtube,URL,Url'

return {
  "folke/todo-comments.nvim",
  enabled = true,
  event = {"BufReadPost", "BufNewFile"},

  -- YouTube: this is it.
  keys = {
    {"<leader>fy", "<cmd>TodoTelescope keywords="..keywords.."<cr>"},
  },

  -- youtube:
  opts = function(_, opts)
    opts.merge_keywords = true
    opts.keywords = {
      YouTube = { icon = " ", color = "#ff0000", alt = {"youtube", "Youtube"}},
      URL = { icon = " ", color = "#7711FF", alt = { "Url", "url" } },
    }
  end,

}
