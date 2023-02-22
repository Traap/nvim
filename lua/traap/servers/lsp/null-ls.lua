local  ok, null_ls = pcall(require, 'null-ls')
if not ok then return end

local formatting = null_ls.builtins.formatting

-- FIXME: Minimize warning information:
--        This function expects a maximum of 0 argument(s)
--        but instead it is receiving 1.

local sources = {
  null_ls.builtins.completion.spell,
  null_ls.builtins.code_actions.gitsigns,
  formatting.rubocop,
  formatting.prettier.with({ extra_args = { "--no-simi", "--single-quote", "--jsx-single-quote" } }),
  formatting.black.with({ extra_args = { "--fast" } }),
  formatting.stylua,
}


null_ls.setup({
  debug = false, sources = sources,
})
