local  status_ok, _ = pcall(require, 'lspconfig')
if not status_ok then return end

require('traap.lsp.lsp-installer')
require('traap.lsp.handlers').setup()

local  null_ls_ok, null_ls = pcall(require, 'null-ls')
if not null_ls_ok then return end

null_ls.setup({
  sources = {
    -- null_ls.builtins.code_actions.gitsigns,
    null_ls.builtins.completion.spell,
    -- null_ls.builtins.diagnostics.eslint,
    null_ls.builtins.diagnostics.write_good,
    null_ls.builtins.formatting.prettier,
    null_ls.builtins.formatting.stylua,
    null_ls.builtins.formatting.rubocop,
  }
})
