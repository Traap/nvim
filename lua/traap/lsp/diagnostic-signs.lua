-- {{{ Credits

-- https://github.com/hackorum/nfs

-- ------------------------------------------------------------------------- }}}
-- {{{ Alias to vim APis.

local vim = vim

-- ------------------------------------------------------------------------- }}}
-- {{{ Diagnostics Signs.

local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }

for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end

-- ------------------------------------------------------------------------- }}}
