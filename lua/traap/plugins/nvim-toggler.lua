require("traap.core.globals")

local plugin = "nvim-toggler"

return {
  "nguyenvukhang/" .. plugin,
  enabled = Is_Enabled(plugin),
  event = {"BufReadPost", "BufNewFile"},

  init = function()
    local toggler = require(plugin)
    vim.keymap.set({'n', 'v'}, '<leader>tn', toggler.toggle, { noremap = true, silent = true, desc = "Toggle operand"})
  end,

  config = function(_, opts)
    local toggler = require(plugin)
    toggler.setup({
      inverses = {
        [">="] = "<=",
        [">"] = "<",
      },
      remove_default_keybinds = true,
      remvoe_default_inverses = false,
    })
  end,
}
