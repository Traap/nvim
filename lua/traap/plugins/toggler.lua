return {
  "nguyenvukhang/nvim-toggler",
  enabled = true,
  event = require("traap.config.events").file,

  config = function()
    local toggler = require("nvim-toggler")

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
  end,
}
