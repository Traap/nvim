require("config.traap.globals")

local plugin = "todo-comments.nvim"

if Is_Enabled(plugin) then
  Keymap("n", "<leader>fy", "<cmd>TodoTelescope keywords=Youtube,URL<cr>")
end

return {
  "folke/" .. plugin,
  enabled = Is_Enabled(plugin),
  opts = function(_, opts)
    if Use_Default_Opts(plugin) then
      opts = opts
    else
      opts.merge_keywords = true
      opts.keywords = {
        Youtube = { icon = " ", color = "#ff0000" },
        URL = { icon = " ", color = "#7711FF", alt = { "Url", "url" } },
      }
    end
  end,
}
