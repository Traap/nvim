local  null_ls_ok, null_ls = pcall(require, 'null-ls')
if not null_ls_ok then return end

null_ls.setup({
  sources = {
    null_ls.builtins.completion.spell,
    null_ls.builtins.diagnostics.write_good,
    null_ls.builtins.formatting.prettier,
    null_ls.builtins.formatting.stylua,
    null_ls.builtins.formatting.rubocop,
  }
})
