-- {{{ Bail when requried packages are not loaded.

local  ts_config_ok, ts_config = pcall(require, 'nvim-treesitter.configs')
if not ts_config_ok then return end

-- ------------------------------------------------------------------------- }}}
-- {{{ Treesitter config setup.

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

-- ------------------------------------------------------------------------- }}}
