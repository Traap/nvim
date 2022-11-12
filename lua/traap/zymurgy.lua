-- zymurgy : The last word in 1980 Webster's new collegiate dictionary.

-- Plugins listed in this file require minimal setup.

local o0, lightbulb = pcall(require, 'nvim-lightbulb')
if o0 then
  lightbulb.setup({autocmd = {enabled = true}})
end

local o1, trouble = pcall(require, 'trouble')
if o1 then
  trouble.setup({})
end

local o2, gitsigns = pcall(require, 'gitsigns')
if o2 then
  gitsigns.setup()
end

local o3, surround = pcall(require, 'nvim-surround')
if o3 then
  surround.setup()
end

local o4, notify = pcall(require, 'notify')
if o4 then
  notify.setup({
    background_colour= "#000000",
  })
end

local o5, _ = pcall(require, 'base16-colorscheme')
if o5 then
  vim.cmd('colorscheme base16-tokyo-night-terminal-storm')
end

local o6, transparent = pcall(require, 'transparent')
if o6 then
  transparent.setup({
    enable = true,
    extra_gropus = {
      'Comment',
      'Folded',
      'Normal',
    },
    exclude = {
      'EndOfBuffer',
      'NonText',
    }
  })
end

local o7, npairs = pcall(require, 'nvim-autopairs')
if o7 then
  npairs.setup()

  local cmp_autopairs = require 'nvim-autopairs.completion.cmp'
  local ok, cmp pcall(require, 'cmp')
  if ok then
    cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done { map_char = { tex = '' } })
  end
end

local o8, impatient = pcall(require, 'impatient')
if o8 then
  impatient .enable_profile()
end


vim.g.transparent_enable = true
vim.api.nvim_create_autocmd('ColorScheme', { command = 'highlight clear Folded'})

-- https://mitchellt.com/2022/05/15/WSL-Neovim-Lua-and-the-Windows-Clipboard.html See
in_wsl = os.getenv('WSL_DISTRO_NAME') ~= nil

if in_wsl then
  vim.g.clipboard = {
    name = 'wsl clipboard',
    copy =  { ["+"] = { "clip.exe" },   ["*"] = { "clip.exe" } },
    paste = { ["+"] = { "nvim_paste" }, ["*"] = { "nvim_paste" } },
    cache_enabled = true
  }
end
