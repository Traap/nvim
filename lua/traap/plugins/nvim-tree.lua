require("traap.core.globals")

local plugin = "nvim-tree"

if Is_Enabled(plugin) then
  Keymap("n", "<c-n>", "<cmd>NvimTreeToggle<cr>")
  Keymap("n", "<leader>nf", "<cmd>NvimTreeFindFile<cr>")
  Keymap("n", "<leader>nr", "<cmd>NvimTreeRefresh<cr>")
end

return {
  "kyazdani42/" .. plugin,
  enabled = Is_Enabled(plugin),
  cmd = { "NvimTreeFindFile", "NvimTreeRefresh", "NvimTreeToggle", },
  opts = function(_, opts)
    if Use_Default_Opts(plugin) then
      opts = opts
    else
      opts.filters = { custom = { ".git" }, }
      opts.view = { side = "right", width = 30, }
    end
  end,
}
