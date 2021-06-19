-- {{{ Requires and aliases

local        gl = require('galaxyline')
local condition = require('galaxyline.condition')

local api = vim.api
local  fn = vim.fn
local gls = gl.section

-- ------------------------------------------------------------------------- }}}
-- {{{ Colors

local colors = {
  -- Mine
  bg = '#22262e',
  fg = '#abb2bf',
  blue = '#7797b7',
  green = '#82ad63',
  grey = '#6f737b',
  lightbg = '#2e323a',
  red = '#d47d85',
  yellow = '#e0c080',
  -- LunarVim
  cyan = '#4EC9B0',
  dark_yellow = '#D7BA7D',
  error_red = '#F44747',
  info_yellow = '#FFCC66',
  light_green = '#B5CEA8',
  magenta = '#D16D9E',
  orange = '#FF8800',
  purple = '#C586C0',
  string_orange = '#CE9178',
  vivid_blue = '#4FC1FF'
}

-- ------------------------------------------------------------------------- }}}
-- {{{ Determine width to squeeze.

local checkwidth = function()
  local squeeze_width = fn.winwidth(0) / 2
  if squeeze_width > 30 then return true end
  return false
end

-- ------------------------------------------------------------------------- }}}
-- {{{ Colors associated with ViMode.

local mode_color = {
  n = colors.blue,
  i = colors.green,
  v = colors.purple,
  [''] = colors.purple,
  V = colors.purple,
  c = colors.magenta,
  no = colors.blue,
  s = colors.orange,
  S = colors.orange,
  [''] = colors.orange,
  ic = colors.yellow,
  R = colors.red,
  Rv = colors.red,
  cv = colors.blue,
  ce = colors.blue,
  r = colors.cyan,
  rm = colors.cyan,
  ['r?'] = colors.cyan,
  ['!'] = colors.blue,
  t = colors.blue
}

-- ------------------------------------------------------------------------- }}}
-- {{{ VI mode names

local mode_names = {
  n      = "Normal ",
  i      = "Insert ",
  c      = "Command",
  V      = "Visual ",
  [""] = "Visual ",
  v      = "Visual ",
  R      = "Replace"
}

-- ------------------------------------------------------------------------- }}}
-- {{{ left[1]

gls.left[1] = {
  statusIcon = {
    provider = function() return "   " end,
    highlight = {colors.bg, colors.blue},
    separator = "",
    separator_highlight = {colors.blue, colors.lightbg}
  }
}

-- ------------------------------------------------------------------------- }}}
-- {{{ left[2]

gls.left[2] = {
  ViMode = {
    provider = function()
      api.nvim_command('hi GalaxyViMode guifg=' .. mode_color[fn.mode()])

      local current_mode = mode_names[fn.mode()]
      if current_mode == nil then
        return "  Terminal "
      else
        return " " .. current_mode .. " "
      end

    end,
    highlight = {colors.red, colors.lightbg}
  }
}

-- ------------------------------------------------------------------------- }}}
-- {{{ left[3]

gls.left[3] = {
  viMode_icon = {
    provider = function() return "   " end,
    highlight = {colors.bg, colors.blue},
    separator = "",
    separator_highlight = {colors.blue, colors.lightbg}
  }
}

-- ------------------------------------------------------------------------- }}}
-- {{{ left[4]

gls.left[4] = {
  FileIcon = {
    provider = "FileIcon",
    condition = condition.buffer_not_empty,
    highlight = {colors.fg, colors.lightbg}
  }
}

-- ------------------------------------------------------------------------- }}}
-- {{{ left[5]

gls.left[5] = {
  FileName = {
    provider = {"FileName"},
    condition = condition.buffer_not_empty,
    highlight = {colors.fg, colors.lightbg},
    separator = " ",
    separator_highlight = {colors.lightbg, colors.bg}
  }
}

-- ------------------------------------------------------------------------- }}}
-- {{{ left[6]

gls.left[6] = {
  DiffAdd = {
    provider = "DiffAdd",
    condition = checkwidth,
    icon = "  ",
    highlight = {colors.fg, colors.bg}
  }
}

-- ------------------------------------------------------------------------- }}}
-- {{{ left[7]

gls.left[7] = {
  DiffModified = {
    provider = "DiffModified",
    condition = checkwidth,
    icon = "   ",
    highlight = {colors.grey, colors.bg}
  }
}

-- ------------------------------------------------------------------------- }}}
-- {{{ left[8]

gls.left[8] = {
  DiffRemove = {
    provider = "DiffRemove",
    condition = checkwidth,
    icon = "  ",
    highlight = {colors.grey, colors.bg}
  }
}

-- ------------------------------------------------------------------------- }}}
-- {{{ left[9]

gls.left[9] = {
  DiagnosticError = {
    provider = "DiagnosticError",
    icon = "  ",
    highlight = {colors.grey, colors.bg}
  }
}

-- ------------------------------------------------------------------------- }}}
-- {{{ left[10]

gls.left[10] = {
  DiagnosticWarn = {
    provider = "DiagnosticWarn",
    icon = "  ",
    highlight = {colors.yellow, colors.bg}
  }
}

-- ------------------------------------------------------------------------- }}}
-- {{{ right[1]

gls.right[1] = {
  GitIcon = {
    provider = function() return " " end,
    condition = require("galaxyline.provider_vcs").check_git_workspace,
    highlight = {colors.grey, colors.lightbg},
    separator = "",
    separator_highlight = {colors.lightbg, colors.bg}
  }
}

-- ------------------------------------------------------------------------- }}}
-- {{{ right[2]

gls.right[2] = {
  GitBranch = {
    provider = "GitBranch",
    condition = require("galaxyline.provider_vcs").check_git_workspace,
    highlight = {colors.grey, colors.lightbg}
  }
}

-- ------------------------------------------------------------------------- }}}
-- {{{ right[3]

gls.right[3] = {
  time_icon = {
    provider = function() return " " end,
    separator = "",
    separator_highlight = {colors.green, colors.bg},
    highlight = {colors.lightbg, colors.green}
  }
}

-- ------------------------------------------------------------------------- }}}
-- {{{ right[4]

gls.right[4] = {
  time = {
    provider = function() return "  " .. os.date("%H:%M") .. " " end,
    highlight = {colors.green, colors.lightbg}
  }
}

-- ------------------------------------------------------------------------- }}}
