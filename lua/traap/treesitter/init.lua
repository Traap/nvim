local ts_config = require("nvim-treesitter.configs")

ts_config.setup {
    ensure_installed = {
        "bash",
        "css",
        "html",
        "javascript",
        "json",
        "latex",
        "lua",
        "python",
        "ruby",
        "typescript",
        "yaml"
    },
    highlight = {
        enable = true,
        use_languagetree = true
    }
}
