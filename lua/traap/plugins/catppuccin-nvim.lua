require("traap.core.globals")

-- Note: The plugin name is 'nvim'.  Horrible name!  Let's see why: I'm going
-- to use the nvim plugin.  What does nvim mean?  If I mention alpha or mini.ui
-- you at least have an idea what the plugin is about. But, not true when I talk
-- about nvim plugin.  Hence we have a name (catppuccin) and a plugin (nvim) variables.
local name = "catppuccin"
local plugin = "nvim"

return {
  name .. "/" .. plugin,
  enabled = Is_Enabled(name),
  name = "catppuccin",
  priority = 1000,
}
