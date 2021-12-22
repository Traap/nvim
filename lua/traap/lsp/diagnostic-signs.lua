-- {{{ Credits

-- https://github.com/hackorum/nfs
--
local vim = vim

-- ------------------------------------------------------------------------- }}}
-- {{{ Diagnostics Signs.

local signs = require('traap/config').diagnostic_signs

for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end

-- ------------------------------------------------------------------------- }}}
