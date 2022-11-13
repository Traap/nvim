local ok, _ = pcall(require, 'base16-colorscheme')

if ok then
  vim.cmd('colorscheme base16-tokyo-night-terminal-storm')
end
