-- {{{ Bail when requried packages are not loaded.

local  config_ok, config = pcall(require, 'nvim-tree.config')
if not config_ok then return end

local  nvim_tree_ok, nvim_tree = pcall(require, 'nvim-tree')
if not nvim_tree_ok then return end

-- ------------------------------------------------------------------------- }}}
-- {{{ Use defaults or customzie this plugin.

local customize = require('traap.core.customize').nvim_tree
if not customize then
  nvim_tree.setup{
  filters = { custom = { '.git' }, },
  view = { side = 'right' }
  }
  return
end

-- --------------------------------------------------------------------------}}}
-- {{{ Define: actions

local actions     = {
  change_dir      = {
    enable        = true,
    global        = false,
  },
  open_file       = {
    quit_on_open  = true,
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
          'diff',
          'fugitive',
          'fugitiveblame',
          'git',
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
-- {{{ Define: renderer

local renderer = {
  add_trailing           = false,
  group_empty            = false,
  highlight_git          = false,
  highlight_opened_files = "none",
  icons                  = {
    git_placement        = "before",
    padding              = " ",
    show                 = {
      file               = true,
      folder             = true,
      folder_arrow       = true,
      git                = true,
    },
    symlink_arrow        = " ➛ ",
    webdev_colors        = true,
    glyphs               = {
      default            = '',
      symlink            = "",
      folder             = {
        arrow_closed     = "",
        arrow_open       = "",
        default          = "",
        empty            = "",
        empty_open       = "",
        open             = "",
        symlink          = "",
        symlink_open     = "",
      },
      git                = {
        deleted          = "",
        ignored          = "◌",
        renamed          = "➜",
        staged           = "✓",
        unmerged         = "",
        unstaged         = "✗",
        untracked        = "★",
      },
    },
  },
  indent_markers         = {
    enable               = false,
    icons                = {
      corner             = "└ ",
      edge               = "│ ",
      none               = "  ",
    },
  },
  root_folder_modifier   = ":~",
  special_files          = { "Cargo.toml", "Makefile", "README.md", "readme.md" },
}
-- ------------------------------------------------------------------------- }}}
-- {{{ Define: git

local  git = {
  enable   = true,
  ignore   = false,
  timeout  = 300,
}

-- ------------------------------------------------------------------------- }}}
-- {{{ Define: hijack directories

local hijack_directories = {
  auto_open              = true,
  enable                 = true,
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
--     Note: Set float.enable = true to experiment a floating NvimTree.

local float = {
  enable          = false,
  open_win_config = {
    relative      = "cursor",
    border        = "rounded",
    width         = 27,
    height        = 27,
    row           = 1,
    col           = 1,
  },
}

local view                    = {
  adaptive_size               = false,
  float                       = float,
  hide_root_folder            = false,
  number                      = false,
  preserve_window_proportions = true,
  relativenumber              = false,
  side                        = 'right',
  signcolumn                  = 'yes',
  width                       = 27,
}

-- ------------------------------------------------------------------------- }}}
-- {{{ Setup nvim tree.

nvim_tree.setup {
  actions                            = actions,
  auto_reload_on_write               = true,
  diagnostics                        = diagnostics,
  disable_netrw                      = false,
  filters                            = filters,
  git                                = git,
  hijack_cursor                      = true,
  hijack_directories                 = hijack_directories,
  hijack_netrw                       = true,
  hijack_unnamed_buffer_when_opening = false,
  update_cwd                         = true,
  system_open                        = system_open,
  update_focused_file                = update_focused_file,
  renderer                           = renderer,
  respect_buf_cwd                    = true,
  sync_root_with_cwd                 = true,
  view                               = view,
}

-- ------------------------------------------------------------------------- }}}
