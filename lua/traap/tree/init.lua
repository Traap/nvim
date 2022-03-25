-- {{{ These additional options must be set BEFORE calling require'nvim-tree'.
--
--   https://github.com/kyazdani42/nvim-tree.lua

vim.g.nvim_tree_show_icons = {
  files         = 1,
  folder_arrows = 1,
  folders       = 1,
  git           = 1,
}

vim.g.nvim_tree_group_empty = 1

vim.g.nvim_tree_icons = {
  default        = '',
  folder         = {
    arrow_closed = '',
    arrow_open   = '',
    default      = '',
    empty        = '',
    empty_open   = '',
    open         = '',
    symlink      = '',
    symlink_open = '',
  },
  git            = {
    deleted      = '',
    ignored      = '◌',
    renamed      = '➜',
    staged       = '✓',
    unmerged     = '',
    unstaged     = '✗',
    untracked    = '★',
  },
  symlink        = '',
}

-- ------------------------------------------------------------------------- }}}
-- {{{ Bail when requried packages are not loaded.

local  config_ok, config = pcall(require, 'nvim-tree.config')
if not config_ok then return end

local  nvim_tree_ok, nvim_tree = pcall(require, 'nvim-tree')
if not nvim_tree_ok then return end

-- ------------------------------------------------------------------------- }}}
-- {{{ Define: actions

local actions     = {
  change_dir      = {
    enable        = true,
    global        = false,
  },
  open_file       = {
    quit_on_open  = false,
    resize_window = false,
    window_picker = {
      chars       = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890',
      enable      = true,
      exclude     = {
        buftype   = {
          'help',
          'nofile',
          'terminal',
        },
        filetype  = {
          'git',
          'diff',
          'fugitive',
          'fugitiveblame',
          'notify',
          'packer',
          'qf',
        },
      }
    }
  },
}

-- ------------------------------------------------------------------------- }}}
-- {{{ Define: diagnostis

local diagnostics = {
  enable          = false,
  icons           = {
    error         = '',
    hint          = '',
    info          = '',
    warning       = '',
  },
}

-- ------------------------------------------------------------------------- }}}
-- {{{ Define: filters

local filters = {
  custom      = {'.git'},
  dotfiles    = false,
  exclude     = {}
}

-- ------------------------------------------------------------------------- }}}
-- {{{ Define: git

local  git = {
  enable   = true,
  height   = true,
  ignore   = false,
  timeout  = 300,
}

-- ------------------------------------------------------------------------- }}}
-- {{{ Define: ignore ft on setup

local ignore_ft_on_setup = {
  'dist',
  'node_modules'
}

-- ------------------------------------------------------------------------- }}}
-- {{{ Define: hijack directories

local hijack_directories = {
  auto_open              = true,
  enable                 = true,
}

-- ------------------------------------------------------------------------- }}}
-- {{{ Define: key mappings

local callback = config.nvim_tree_callback

local keymap = {
  { key = {'<CR>', 'o', '<2-LeftMouse>'}, cb = callback('edit') },
  { key = {'<2-RightMouse>', '<C-}>'},    cb = callback('cd') },
  { key = '-',                            cb = callback('dir_up') },
  { key = '<',                            cb = callback('prev_sibling') },
  { key = '<BS>',                         cb = callback('close_node') },
  { key = '<C->',                         cb = callback('full_rename') },
  { key = '<S-CR>',                       cb = callback('close_node') },
  { key = '<Tab>',                        cb = callback('preview') },
  { key = '>',                            cb = callback('next_sibling') },
  { key = 'H',                            cb = callback('toggle_dotfiles') },
  { key = 'I',                            cb = callback('toggle_ignored') },
  { key = 'J',                            cb = callback('last_sibling') },
  { key = 'K',                            cb = callback('first_sibling') },
  { key = 'P',                            cb = callback('parent_node') },
  { key = 'R',                            cb = callback('refresh') },
  { key = 'Y',                            cb = callback('copy_path') },
  { key = '[c',                           cb = callback('prev_git_item') },
  { key = ']c',                           cb = callback('next_git_item') },
  { key = 'a',                            cb = callback('create') },
  { key = 'c',                            cb = callback('copy') },
  { key = 'd',                            cb = callback('remove') },
  { key = 'g?',                           cb = callback('toggle_help') },
  { key = 'gy',                           cb = callback('copy_absolute_path') },
  { key = 'p',                            cb = callback('paste') },
  { key = 'q',                            cb = callback('close') },
  { key = 'r',                            cb = callback('rename') },
  { key = 's',                            cb = callback('split') },
  { key = 't',                            cb = callback('tabnew') },
  { key = 'v',                            cb = callback('vsplit') },
  { key = 'x',                            cb = callback('cut') },
  { key = 'y',                            cb = callback('copy_name') },
  { key = '<C-t>', cb = "<cmd>lua require'telescope.builtin'.live_grep()<cr>"},
}

local mappings = {
  custom_only  = false,
  list         = keymap,
}

-- ------------------------------------------------------------------------- }}}
-- {{{ Define: system open

local system_open = {
  cmd       = nil,
  args      = {},
}

-- ------------------------------------------------------------------------- }}}
-- {{{ Define: update focused file

local update_focused_file = {
  enable            = true,
  ignore_list       = {'fzf'},
  update_cwd        = true,
}

-- ------------------------------------------------------------------------- }}}
-- {{{ Define: view

local view                    = {
  auto_resize                 = false,
  height                      = 27,
  hide_root_folder            = false,
  mappings                    = mappings,
  number                      = false,
  preserve_window_proportions = false,
  relativenumber              = false,
  side                        = 'right',
  signcolumn                  = 'yes',
  width                       = 27,
}

-- ------------------------------------------------------------------------- }}}
-- {{{ Setup nvim tree.

nvim_tree.setup {
  actions                            = actions,
  auto_close                         = true,
  auto_reload_on_write               = true,
  diagnostics                        = diagnostics,
  disable_netrw                      = false,
  filters                            = filters,
  git                                = git,
  hijack_cursor                      = true,
  hijack_directories                 = hijack_directories,
  hijack_netrw                       = true,
  hijack_unnamed_buffer_when_opening = false,
  ignore_buffer_on_setup             = false,
  ignore_ft_on_setup                 = ignore_ft_on_setup,
  open_on_setup                      = false,
  open_on_tab                        = false,
  update_cwd                         = true,
  system_open                        = system_open,
  update_focused_file                = update_focused_file,
  view                               = view,
}

-- ------------------------------------------------------------------------- }}}
