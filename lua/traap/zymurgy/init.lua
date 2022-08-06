-- zymurgy : The last word in 1980 Webster's new collegiate dictionary.

-- Plugins listed in this file require minimal setup.

local ok, lightbulb = pcall(require, 'nvim-lightbulb')
if ok then
  lightbulb.setup({autocmd = {enabled = true}})
end

local ok, trouble = pcall(require, 'trouble')
if ok then
  trouble.setup({})
end

local ok, gitsigns = pcall(require, 'gitsigns')
if ok then
  gitsigns.setup()
end

local ok, surround = pcall(require, 'nvim-surround')
if ok then
  surround.setup()
end

local ok, notify = pcall(require, 'notify')
if ok then
  vim.notify = notify
end
