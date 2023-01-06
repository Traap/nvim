-- {{{ Clear some items.

local color_group = vim.api.nvim_create_augroup('Clear', { clear = true})
vim.api.nvim_create_autocmd(
  'BufEnter', {
    command = 'highlight clear Folded | highlight ColorColumn guibg=#202031 | highlight LineNr guifg=#902090 | highlight LineNrAbove guifg=#787c99 | highlight LineNrBelow guifg=#787c99',
    group = color_group,
  }
)

-- ------------------------------------------------------------------------- }}}
-- {{{ csv

local csv_group = vim.api.nvim_create_augroup('csv', { clear = true })
vim.api.nvim_create_autocmd(
  {'BufRead','BufNewFile'}, {
    command = 'setlocal filetype=csv nowrap textwidth=0',
    group = csv_group,
    pattern = '*.csv',
  }
)

-- ------------------------------------------------------------------------- }}}
-- {{{ json

local json_group = vim.api.nvim_create_augroup('Json', { clear = true })
vim.api.nvim_create_autocmd(
  {'BufRead','BufNewFile'}, {
    command = [[syntax match Comment +\/\/.\+$+]],
    group = json_group,
    pattern = '*.json'
  }
)

-- ------------------------------------------------------------------------- }}}
-- {{{ Packer

local packer_group = vim.api.nvim_create_augroup('Packer', { clear = true })
vim.api.nvim_create_autocmd(
  'BufWritePost', {
    command = 'source <afile> | PackerSync',
    group = packer_group,
    pattern = {
      vim.fn.expand '$MYVIMRC',
      vim.fn.expand '$GITHOME' .. '/lua/traap/core/plugins.lua',
    },
  }
)

-- ------------------------------------------------------------------------- }}}
-- {{{ PlantUML

vim.api.nvim_create_autocmd(
  {'BufRead', 'BufNewFile'}, {
    command = 'call InitUmlSettings()',
    pattern = {'*.puml', '*.wsd'},
  }
)

vim.api.nvim_create_autocmd(
  'BufWritePost', {
    command = 'call GenerateUmlDiagram()',
    pattern = {'*.puml', '*.wsd'},
  }
)

vim.api.nvim_create_autocmd(
  'BufLeave', {
    command = 'call ClearUmlLaunchFlag()',
    pattern = {'*.puml', '*.wsd'},
  }
)

-- ------------------------------------------------------------------------- }}}
-- {{{ TeX

local tex_group = vim.api.nvim_create_augroup('Tex', { clear = true })
vim.api.nvim_create_autocmd(
  {'BufRead','BufNewFile'}, {
    command = 'setlocal filetype=tex',
    group = tex_group,
    pattern = {'*.tex', '*.bbl', '*.bib', '*.texx', '*.texb', '*.cls'},
  }
)

-- ------------------------------------------------------------------------- }}}
-- {{{ Wiki

local wiki_group = vim.api.nvim_create_augroup('Wiki', { clear = true })
vim.api.nvim_create_autocmd(
  {'BufRead','BufNewFile'}, {
    command = 'setlocal foldlevelstart=2 filetype=wiki | WikiEnable',
    group = wiki_group,
    pattern = {'*.md', '*.markdown', '*.wiki'},
  }
)

-- ------------------------------------------------------------------------- }}}
-- {{{ WhiteSpace

local whitespace_group = vim.api.nvim_create_augroup('WhiteSpace', { clear = true })
vim.api.nvim_create_autocmd(
  'BufWritePre', {
    command = [[%s/\s\+$//e]],
    group = whitespace_group,
  }
)

-- ------------------------------------------------------------------------- }}}
