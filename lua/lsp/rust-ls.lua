require'lspconfig'.rust_analyzer.setup{
    cmd = {"rust-analyzer"},
    filetypes = { "rs", "rust" }
}
