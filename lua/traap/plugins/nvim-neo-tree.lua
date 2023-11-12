require("traap.core.globals")

local plugin = "neo-tree.nvim"

-- Note:  nvim-tree takes precedence when both neo-tree.nvim and nvim-tree
if Is_Enabled(plugin) and
  not Use_Default_Keys(plugin) and
  not Is_Enabled("nvim-tree") then
  Keymap("n", "<c-n>", "<cmd>Neotree toggle<cr>")
  Keymap("n", "<leader>nf", "<cmd>Neotree focus<cr>")
  Keymap("n", "<leader>nr", "<cmd>Neotree show<cr>")
end

return {
  "nvim-neo-tree/" .. plugin,
  enabled = Is_Enabled(plugin),
  keys = false,
  opts = function(_, opts)
    if Use_Default_Opts(plugin) then
      opts = opts
    else
      opts.filesystem = {
        bind_to_cwd = false,
        follow_current_file = { enabled = true}
      }
      opts.window = { position = "right", }
    end
  end,
}
