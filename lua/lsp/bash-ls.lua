-- npm i -g bash-language-server

require'lspconfig'.bashls.setup {
    filetypes = { "bash", "sh", "zsh" }
}
