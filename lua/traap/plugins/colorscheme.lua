local  ok, _ = pcall(require, 'base16-colorscheme')
if not ok then return end

-- Youtube: Telescope borders
function ColorScheme(color)
  local cs = require("traap.core.customize").colorscheme

  local tokyonight = 'base16-tokyo-night-terminal-storm'

  if cs.base16 then
    tokyonight = 'base16-tokyo-night-terminal-storm'
  elseif cs.folke then
    tokyonight = 'tokyonight-storm'
  end

  color = color or tokyonight
  vim.cmd.colorscheme(color)
end

ColorScheme()
