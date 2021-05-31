local ts_config = require("nvim-treesitter.configs")

ts_config.setup {
    ensure_installed = {
        "bash",
        "css",
        "html",
        "javascript",
        "json",
        "lua",
        "python"
    },
    highlight = {
        enable = true,
        use_languagetree = true
    }
}
