require("config.traap.globals")

local plugin = "nvim-toggler"

return {
  "nguyenvukhang/" .. plugin,
  enabled = Is_Enabled(plugin),
  event = {"BufReadPost", "BufNewFile"},

  init = function()
    if not Use_Default_Keys(plugin) then
      local toggler = require(plugin)
      vim.keymap.set({'n', 'v'}, '<leader>tn', toggler.toggle)
    end
  end,

  config = function(_, opts)
    local toggler = require(plugin)
    if Use_Default_Config(plugin) then
      toggler.setup(opts)
    else
      toggler.setup({
        inverses = {
          [">="] = "<=",
          [">"] = "<",
        },
        remove_default_keybinds = true,
        remvoe_default_inverses = false,
      })
    end
  end,
}
