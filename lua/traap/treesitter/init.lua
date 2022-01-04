local ts_config = require("nvim-treesitter.configs")

ts_config.setup {
    ensure_installed = 'maintained',
    sync_install = false,
    ignore_install = {''},
    autopairs = {enable = true,},
    highlight = {
        enable = true,
        disable = {''},
        additional_vim_regex_highlighting=true,
    },
    indent = {enable = true, disable = {'yaml'}},
    context_commenting = {
      enable = true,
      enable_autocmd = false,
    },
}
