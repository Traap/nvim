require("config.traap.globals")

local plugin = "alpha-nvim"

if Is_Enabled(plugin) then
  Keymap("n", "<leader>aa", "<cmd>Alpha<cr>")
end

return {
  "goolord/" .. plugin,
  enabled = Is_Enabled(plugin),
  opts = function(_, opts)
    if Use_Default_Opts(plugin) then
      opts = opts
    else
      opts = {}
    end
  end,
}
