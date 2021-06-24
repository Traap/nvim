-- {{{ Alias to vim APis.

local   g = vim.g
local cmd = vim.cmd
local opt = vim.opt

-- ------------------------------------------------------------------------- }}}
-- {{{ Wiki Export Command

g.traap_wiki_export = {
  args = '--metadata-file=$HOME/git/wiki/wiki.yaml',
  ext = 'pdf',
  from_format = 'markdown',
  link_ext_replace = false,
  output = 'printed',
  view = true,
}

-- ------------------------------------------------------------------------- }}}
