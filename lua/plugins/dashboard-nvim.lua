require("config.traap.globals")

local plugin = "dashboard-nvim"

if Is_Enabled(plugin) then
  Keymap("n", "<leader>aa", "<cmd>Dashboard<cr>")
end

return {
  "glepnir/" .. plugin,
  enabled = Is_Enabled(plugin),
  opts = function(_, opts)
    if Use_Default_Opts(plugin) then
      opts = opts
    else
      opts = {}
    end
  end,
}
