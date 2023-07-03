require("config.globals")

local plugin = "nvim-lightbulb"

return {
  "kosayoda/" .. plugin,
  event = "BufReadPre",
  enabled = Is_Enabled(plugin),
  dependencies = { "antoinemadec/FixCursorHold.nvim" },
  opts = function(_, opts)
    if Use_Defaults(plugin) then
      opts = opts
    else
      opts.autocmd = { enabled = true }
    end
  end,
}
