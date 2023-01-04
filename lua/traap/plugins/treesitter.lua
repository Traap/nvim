-- {{{ Bail when requried packages are not loaded.

local  config_ok, config = pcall(require, 'nvim-treesitter.configs')
if not config_ok then return end

-- ------------------------------------------------------------------------- }}}
-- {{{ Use defaults or customzie this plugin.

local customize = require('traap.core.customize').treesitter
if not customize then
  config.setup()
  return
end

-- --------------------------------------------------------------------------}}}
-- {{{ Treesitter config setup.

local languages = {
  'bash',
  'c',
  'c_sharp',
  'cpp',
  'dockerfile',
  'graphql',
  'html',
  'json',
  'lua',
  'python',
  'ruby',
  'rust',
  'sql',
  'vim',
  'yaml',
}

local disable = {
  'css',
  'latex',
  'markdown',
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
    disable = disable,
    additional_vim_regex_highlighting=true,
  },

  ignore_install = {''},

  indent = {enable = true, disable = {'yaml'}},

  playground = { enable = true, },

  query_linter = {
    enable = true,
    use_virtual_text = true,
    lint_events = {'BufWrite', 'CursorHold'}
  },

  rainbow = {
    colors = {
      "Gold",
      "Orchid",
      "DodgerBlue",
      "Cornsilk",
      "Salmokn",
      "LawnGreen",
    },
    disable = { "html" },
    enable = true,
    extended_mode = true,
    max_file_lines = 2000,
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
