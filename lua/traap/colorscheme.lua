local  ok, _ = pcall(require, 'base16-colorscheme')
if not ok then return end

function ColorScheme(color)
  color = color or 'base16-tokyo-night-terminal-storm'
  vim.cmd.colorscheme(color)
  vim.api.nvim_set_hl(0, 'Normal', {bg = 'none'})
  vim.api.nvim_set_hl(0, 'NormalFloat', {bg = 'none'})
end

ColorScheme()
