-- {{{ Bail when requried packages are not loaded.

local  telescope_ok, telescope = pcall(require, 'telescope')
if not telescope_ok then return end

-- ------------------------------------------------------------------------- }}}
-- {{{ Setup telescope.

local actions = require 'telescope.actions'

telescope.setup {
  defaults = {
    border = {},
    borderchars = {'─', '│', '─', '│', '╭', '╮', '╯', '╰'},
    buffer_previewer_maker = require 'telescope.previewers'.buffer_previewer_maker,
    color_devicons = true,
    entry_prefix = '  ',
    file_ignore_patterns = {},
    file_previewer = require 'telescope.previewers'.vim_buffer_cat.new,
    file_sorter = require 'telescope.sorters'.get_fuzzy_file,
    generic_sorter = require 'telescope.sorters'.get_generic_fuzzy_sorter,
    grep_previewer = require 'telescope.previewers'.vim_buffer_vimgrep.new,
    initial_mode = 'insert',
    layout_config = {
      horizontal = {
        mirror = false,
        preview_width = 0.5
      },
      vertical = { mirror = false },
      width = 0.75
    },
    layout_strategy = 'horizontal',
    mappings = {
      i = {
        ["<C-j>"] = actions.move_selection_next,
        ["<C-k>"] = actions.move_selection_previous,
      },

      n = {
        ["<esc>"] = actions.close,
        ["<CR>"] = actions.select_default,

        ["<C-x>"] = actions.select_horizontal,
        ["<C-v>"] = actions.select_vertical,
        ["j"] = actions.move_selection_next,
        ["k"] = actions.move_selection_previous,
      },
    },
    prompt_prefix = " ",
    qflist_previewer = require 'telescope.previewers'.vim_buffer_qflist.new,
    selection_caret = " ",
    selection_strategy = 'reset',
    set_env = {['COLORTERM'] = 'truecolor'},
    sorting_strategy = 'descending',
    use_less = true,
    vimgrep_arguments = {
      'rg',
      '--color=never',
      '--column',
      '--line-number',
      '--no-heading',
      '--smart-case',
      '--with-filename'
    },
    winblend = 0,
  },
  extensions = {
    fzf = {
      fuzzy = true,
      override_generic_sorter = true,
      override_file_sorter = true,
      case_mode = 'smart_case',
    },
    media_files = {
      filetypes = {'pdf', 'png', 'webp', 'jpg', 'jpeg'},
      find_cmd = 'rg'
    }
  }
}

-- ------------------------------------------------------------------------- }}}
-- {{{ Load extensions.

local extensions = {
  'fzf',
  -- 'luasnip',
  'media_files',
}

for _, name in ipairs(extensions) do
  telescope.load_extension(name)
end

-- ------------------------------------------------------------------------- }}}
