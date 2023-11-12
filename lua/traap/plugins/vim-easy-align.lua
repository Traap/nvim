require("traap.core.globals")

local plugin = "vim-easy-align"

if Is_Enabled(plugin) then
  vim.cmd([[
    xmap ga <Plug>(EasyAlign)
    nmap ga <Plug>(EasyAlign)
    nmap <bar>     gaip*<bar>
    nmap <leader>0 gaip*,
    nmap <leader>1 gaip=,
    nmap <leader>2 gaip=<space>
    ]])
end

return {
  "junegunn/" .. plugin,
  event = { "BufReadPost", "BufNewFile" },
  enabled = Is_Enabled(plugin),
}
