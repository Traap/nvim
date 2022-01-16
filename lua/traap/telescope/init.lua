-- {{{ Bail when requried packages are not loaded.

local  telescope_ok, telescope = pcall(require, 'telescope')
if not telescope_ok then return end

-- ------------------------------------------------------------------------- }}}
-- {{{ Setup telescope.

telescope.setup {
  defaults = {
    vimgrep_arguments = {
      'rg',
      '--color=never',
      '--no-heading',
      '--with-filename',
      '--line-number',
      '--column',
      '--smart-case'
    },
    prompt_prefix = " ",
    selection_caret = " ",
    entry_prefix = '  ',
    initial_mode = 'insert',
    selection_strategy = 'reset',
    sorting_strategy = 'descending',
    layout_strategy = 'horizontal',
    layout_config = {
      horizontal = {
        mirror = false,
        preview_width = 0.5
      },
      vertical = {
        mirror = false
      },
      width = 0.75
    },
    file_sorter = require 'telescope.sorters'.get_fuzzy_file,
    file_ignore_patterns = {},
    generic_sorter = require 'telescope.sorters'.get_generic_fuzzy_sorter,
    -- path_display = true,
    winblend = 0,
    border = {},
    borderchars = {'─', '│', '─', '│', '╭', '╮', '╯', '╰'},
    color_devicons = true,
    use_less = true,
    set_env = {['COLORTERM'] = 'truecolor'}, -- default = nil,
    file_previewer = require 'telescope.previewers'.vim_buffer_cat.new,
    grep_previewer = require 'telescope.previewers'.vim_buffer_vimgrep.new,
    qflist_previewer = require 'telescope.previewers'.vim_buffer_qflist.new,
    buffer_previewer_maker = require 'telescope.previewers'.buffer_previewer_maker
  },
  extensions = {
    media_files = {
      filetypes = {'pdf', 'png', 'webp', 'jpg', 'jpeg'},
      find_cmd = 'rg'
    }
  }
}

-- ------------------------------------------------------------------------- }}}
-- {{{ Load media files extensions.

require('telescope').load_extension('media_files')

-- ------------------------------------------------------------------------- }}}
