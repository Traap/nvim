return {
  "dfendr/clipboard-image.nvim",
  event = { "BufReadPost", "BufNewFile" },
  enabled = true,

  keys = {
    {"<leader>pi", "<cmd>PasteImg<cr>", "Save and Past Image"}
  },

  config = function()
    require("clipboard-image").setup({
      default  = {
        img_dir = {"images", "%:p:h:t", "%:t:r"},
        img_dir_txt = {"images", "%:p:h:t", "%:t:r"},
        img_name = function ()
          vim.fn.inputsave()
          local name = vim.fn.input('Name: ')
          vim.fn.inputrestore()
          if name == nil or name == '' then
            return os.date('%y-%m-%d-%H-%M-%S')
          end
          return name
        end,
        affix  = "%s",
      },
      markdown = { affix = "![](%s)" },
      tex      = { affix = "{\\includegraphics{%s}}" },
      wiki     = { affix = "![](%s)" },
    })
  end,
}
