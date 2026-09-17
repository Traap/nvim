local platform = require("traap.core.platform")
return {
  "odiumuniverse/herdr-smart-nav",
  enabled = platform.is_nvim() and platform.in_herdr(),
  keys = {
    { "<c-h>", function() platform.navigate("left") end,  desc = "Navigate Left", },
    { "<c-j>", function() platform.navigate("down") end,  desc = "Navigate Down", },
    { "<c-k>", function() platform.navigate("up") end,    desc = "Navigate Up", },
    { "<c-l>", function() platform.navigate("right") end, desc = "Navigate Right", },
  },
  build = "cargo build --release",
  opts = {},
}
