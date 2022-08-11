-- {{{ Bail when requried packages are not loaded.

local  config_ok, config = pcall(require, 'nvim-treesitter.configs')
if not config_ok then return end

-- ------------------------------------------------------------------------- }}}
-- {{{ Treesitter config setup.

languages = {
  'bash',
  'c',
  'c_sharp',
  'comment',
  'cpp',
  'css',
  'dockerfile',
  'graphql',
  'html',
  'http',
  'json',
  'latex',
  'lua',
  'markdown',
  'pascal',
  'ruby',
  -- 'rust',
  'sql',
  'vim',
  'yaml',
}

config.setup {
  autopairs = {enable = true,},
  autotag = {
    enable = true,
    disable = { "xml" },
  },
  context_commenting = {
    enable = true,
    enable_autocmd = false,
  },
  ensure_installed = languages,
  highlight = {
    enable = true,
    disable = {'css', 'markdown'},
    additional_vim_regex_highlighting=true,
  },
  ignore_install = {''},
  indent = {enable = true, disable = {'yaml'}},
  playground = { enable = true, },
  rainbow = {
    colors = {
      "Gold",
      "Orchid",
      "DodgerBlue",
      "Cornsilk",
      "Salmon",
      "LawnGreen",
    },
    disable = { "html" },
    enable = true,
    extended_mode = true,
  },
  refactor = {
    highlight_current_scope = { enable = true },
    highlight_definitions = {
      enable = true,
      clear_on_cursor_move = true,
    },
    navigation = {
      enable = true,
      keymaps = {
        goto_definition = "gnd",
        list_definitions = "gnD",
        list_definitions_toc = "gO",
        goto_next_usage = "<a-*>",
        goto_previous_usage = "<a-#>",
      },
    },
    smart_rename = {
      enable = true,
      keymaps = {
        smart_rename = "grr",
      },
    },
  },
  sync_install = false,
}

-- ------------------------------------------------------------------------- }}}
