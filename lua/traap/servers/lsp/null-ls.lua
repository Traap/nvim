local ok, null_ls = pcall(require, "null-ls")
if not ok then
  return
end

local formatting = null_ls.builtins.formatting

null_ls.setup({
  sources = {
    null_ls.builtins.completion.spell,
    null_ls.builtins.code_actions.gitsigns,
    formatting.rubocop,
    formatting.prettier.with({ extra_args = { "--no-simi", "--single-quote", "--jsx-single-quote" } }),
    formatting.black.with({ extra_args = { "--fast" } }),
    formatting.stylua,
  },

  on_attach = function(client)
    if client.server_capabilities.document_formatting then
      vim.cmd([[autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_seq_sync()]])

      if client.server_capabilities.document_highlight then
        vim.api.nvim_exec(
          [[
          augroup document_highlight
            autocmd! * <buffer>
            autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
            autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
          augroup END
         ]],
          false
        )
      end
    end
  end,
})
