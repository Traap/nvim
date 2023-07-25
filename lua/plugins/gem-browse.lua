require("config.traap.globals")

local plugin = "gem-browse"

return {
  "tpope/" .. plugin,
  event = { "BufEnter *.rb", "BufEnter *.gemspec", "BufEnter Gemfile" },
  enabled = Is_Enabled(plugin),
}
