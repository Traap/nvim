return {
  "junegunn/vim-easy-align",
  event = { "BufReadPost", "BufNewFile" },
  enabled = true,

  config = function()
    vim.cmd([[silent xmap ga <Plug>(EasyAlign)]])
    vim.cmd([[silent nmap ga <Plug>(EasyAlign)]])
    vim.cmd([[silent nmap <bar>     gaip*<bar>]])
    vim.cmd([[silent nmap <leader>0 gaip*,]])
    vim.cmd([[silent nmap <leader>1 gaip=,]])
    vim.cmd([[silent nmap <leader>2 gaip=<space>]])
  end,
}
