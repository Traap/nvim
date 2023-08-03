require("config.traap.globals")

local plugin = "nvim-toggler"

if Is_Enabled(plugin) and not Use_Default_Keys(plugin) then
  local cmdL = "<cmd> lua require('nvim-toggler').toggle<cr>"
  Keymap("n", "<leader>tn", cmdL)
  Keymap("v", "<leader>tn", cmdL)
end

return {
  "nguyenvukhang/" .. plugin,
  enabled = Is_Enabled(plugin),
  event = {"BufReadPost", "BufNewFile"},
  config = function(_, opts)
    local toggle = require(plugin)
    if Use_Default_Config(plugin) then
      toggle.setup(opts)
    else
      toggle.setup({
        inverses = {
          [">="] = "<=",
          ["<="] = "<=",
          [">"] = "<",
          ["<"] = ">",
        }
      })
    end
  end,
}
