local  ok, _ = pcall(require, 'base16-colorscheme')
if not ok then return end

function ColorScheme(color)
  color = color or 'base16-tokyo-night-terminal-storm'
  vim.cmd.colorscheme(color)
end

ColorScheme()
