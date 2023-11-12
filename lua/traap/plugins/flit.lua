require("traap.core.globals")

local plugin = "flit.nvim"

return {
  "ggandor/" .. plugin,
  enabled = Is_Enabled(plugin),
  keys = function()
    local ret = {}
    for _, key in ipairs({ "f", "F", "t", "T" }) do
      ret[#ret + 1] = { key, mode = { "n", "x", "o" }, desc = key }
    end
    return ret
  end,
  opts = { labeled_modes = "nx" },
}
