require("traap.core.globals")

local plugin = "todo-comments.nvim"

if Is_Enabled(plugin) then
  local keywords = 'YouTube,Youtube,URL,Url'
  Keymap("n", "<leader>fy", "<cmd>TodoTelescope keywords="..keywords.."<cr>")
end

return {
  "folke/" .. plugin,
  enabled = Is_Enabled(plugin),

  opts = function(_, opts)
    opts.merge_keywords = true
    opts.keywords = {
      YouTube = { icon = " ", color = "#ff0000", alt = {"youtube", "Youtube"}},
      -- URL = { icon = " ", color = "#7711FF", alt = { "Url", "url" } },
    }
  end,
}
