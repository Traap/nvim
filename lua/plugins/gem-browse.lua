Customize = require("config.customize")
Is_Enabled = require("config.functions").is_enabled

local plugin = "gem-browse"

return {
  "tpope/" .. plugin,
  event = { "BufEnter *.rb", "BufEnter *.gemspec", "BufEnter Gemfile" },
  enabled = Is_Enabled(plugin),
}
