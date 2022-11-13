vim.api.nvim_create_autocmd({ "BufEnter", "ColorScheme" },{
  pattern = { "" },
  callback = function()
    vim.cmd [[
      highlight clear Folded
      highlight ColorColumn ctermbg=18
    ]]
  end
})
