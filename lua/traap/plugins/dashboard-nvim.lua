require("traap.core.globals")

local plugin = "dashboard-nvim"

-- if Is_Enabled(plugin) then
--   Keymap("n", "<leader>aa", "<cmd>Dashboard<cr>")
-- end

return {
  "nvimdev/" .. plugin,
  cmd = "Dashboard",
  key = {"<leader>aa", "<cmd>Dashboard<>"},
  event = "VeryLazy",
  enabled = Is_Enabled(plugin),
  config = true,

  -- opts = function(_, opts)
  --   if Use_Default_Opts(plugin) then
  --     opts = opts
  --   else
  --     opts = {}
  --   end
  -- end,
}
