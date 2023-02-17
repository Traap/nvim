-- {{{ Acknowledgement and source
--
-- Acknowledgement:  Folke Lemaitre
--           https://github.com/folke
--
-- Original work:
-- https://github.com/LazyVim/LazyVim/blob/ba7942b80bba69592bb1b14b91bff6d356d9151e/lua/lazyvim/plugins/lsp/keymaps.lua
--
-- Original work was extracted and tailored to my specific needs.
--
-- ------------------------------------------------------------------------- }}}
-- {{{ Metatable M

local M = {}

M._keys = nil

-- ------------------------------------------------------------------------- }}}
-- {{{ M.get

function M.get()
  M._keys =  {
    { '<c-k>',      vim.lsp.buf.signature_help, desc = 'Signature Help', mode = 'i', has = 'signatureHelp' },
    { 'gK',         vim.lsp.buf.signature_help, desc = 'Signature Help', has = 'signatureHelp' },
    { 'gD',         vim.lsp.buf.declaration,    desc = 'Goto Declaration' },
    { '<leader>ca', vim.lsp.buf.code_action,    desc = 'Code Action', mode = { 'n', 'v' }, has = 'codeAction' },

    { '<leader>cf', format, desc = 'Format Document', has = 'documentFormatting' },
    { '<leader>cf', format, desc = 'Format Range', mode = 'v', has = 'documentRangeFormatting' },
    { '<leader>cl', '<cmd>LspInfo<cr>', desc = 'Lsp Info' },
    { 'K', vim.lsp.buf.hover, desc = 'Hover' },

    { '<leader>cd', vim.diagnostic.open_float, desc = 'Line Diagnostics' },

    { '[d', M.diagnostic_goto(false), desc = 'Prev Diagnostic' },
    { ']d', M.diagnostic_goto(true),  desc = 'Next Diagnostic' },

    { '[e', M.diagnostic_goto(false, 'ERROR'), desc = 'Prev Error' },
    { ']e', M.diagnostic_goto(true, 'ERROR'),  desc = 'Next Error' },

    { '[w', M.diagnostic_goto(false, 'WARN'), desc = 'Prev Warning' },
    { ']w', M.diagnostic_goto(true, 'WARN'),  desc = 'Next Warning' },


    { 'gI', '<cmd>Telescope lsp_implementations<cr>',  desc = 'Goto Implementation' },
    { 'gd', '<cmd>Telescope lsp_definitions<cr>',      desc = 'Goto Definition' },
    { 'gr', '<cmd>Telescope lsp_references<cr>',       desc = 'References' },
    { 'gt', '<cmd>Telescope lsp_type_definitions<cr>', desc = 'Goto Type Definition' },
  }
  if require('traap.servers.lsp.handlers').has('inc-rename.nvim') then
    M._keys[#M._keys + 1] = {
      '<leader>cr',
      function()
        require('inc_rename')
        return ':IncRename ' .. vim.fn.expand('<cword>')
      end,
      expr = true,
      desc = 'Rename',
      has = 'rename',
    }
  else
    M._keys[#M._keys + 1] = {
      '<leader>cr', vim.lsp.buf.rename, desc = 'Rename', has = 'rename'
    }
  end
  return M._keys
end

-- ------------------------------------------------------------------------- }}}
-- {{{ Return Metatable M

return M

-- ------------------------------------------------------------------------- }}}
