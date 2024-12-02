return {
  "ysmb-wtsg/in-and-out.nvim",
  enable = true,
  keys = {
    {
      "<c-l>",
      function()
        require("in-and-out").in_and_out()
      end,
      mode = "i"
    },
  },
}
