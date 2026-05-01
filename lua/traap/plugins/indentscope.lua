local platform = require("traap.core.platform")

return {
  "nvim-mini/mini.indentscope",
  event = require("traap.config.events").file,
  enabled = true and platform.is_nvim(),
  opts = function()
    local indentscope = require("mini.indentscope")

    return {
      draw = {
        animation = indentscope.gen_animation.none(),
        delay = 0,
      },
      symbol = "│",
    }
  end,
}
