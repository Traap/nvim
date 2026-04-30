local platform = require("traap.core.platform")
return {
  "lervag/vimtex",
  ft = { "tex", "texx" },
  enabled = true and platform.is_nvim(),
}
