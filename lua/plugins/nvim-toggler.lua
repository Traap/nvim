require("config.traap.globals")

local plugin = "nvim-toggler"

return {
  "nguyenvukhang/" .. plugin,
  enabled = Is_Enabled(plugin),
  event = {"BufReadPost", "BufNewFile"},

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
        remove_default_inverses = false,
      })

      vim.keymap.set( {'n', 'v'},
        '<leader>tn', toggler.toggle,
        { noremap = true, silent = true, desc = "Toggle operand"}
      )
    end
  end,
}
