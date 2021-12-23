-- {{{ Requires and aliases

local        gl = require('galaxyline')
local condition = require('galaxyline.condition')
local       gls = gl.section

local        api = vim.api
local         bo = vim.bo
local         fn = vim.fn
local treesitter = vim.treesitter

-- ------------------------------------------------------------------------- }}}
-- {{{ Colors

local colors = {
  bg = '#292D38',
  yellow = '#DCDCAA',
  dark_yellow = '#D7BA7D',
  cyan = '#4EC9B0',
  green = '#608B4E',
  light_green = '#B5CEA8',
  string_orange = '#CE9178',
  orange = '#FF8800',
  purple = '#C586C0',
  magenta = '#D16D9E',
  grey = '#858585',
  blue = '#569CD6',
  vivid_blue = '#4FC1FF',
  light_blue = '#9CDCFE',
  red = '#D16969',
  error_red = '#F44747',
  info_yellow = '#FFCC66'
}

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
-- {{{ Short line list

gl.short_line_list = {'NvimTree', 'vista', 'dbui', 'packer'}

-- ------------------------------------------------------------------------- }}}
-- {{{ ViMode

table.insert(gls.left, {
  ViMode = {
    provider = function()

      local color = mode_color[fn.mode()]
      if color == nil then color = colors.blue end

      local name = mode_names[fn.mode()]
      if name == nil then name = 'Normal' end

      api.nvim_command('hi GalaxyViMode guifg=' .. color)
      return '▊ ' .. name

    end,
    highlight = {colors.red, colors.bg}
  }
})

-- ------------------------------------------------------------------------- }}}
-- {{{ File icon

table.insert(gls.left, {
  FileIcon = {
    provider = 'FileIcon',
    condition = condition.buffer_not_empty,
    highlight = {colors.magenta, colors.bg}
  }
})

-- ------------------------------------------------------------------------- }}}
-- {{{ File name

table.insert(gls.left, {
  FileName = {
    provider = 'FileName',
    condition = condition.buffer_not_empty,
    highlight = {colors.magenta, colors.bg}
  }
})

-- ------------------------------------------------------------------------- }}}
-- {{{ Git workspace check

print(fn.getbufvar(0, 'ts'))
fn.getbufvar(0, 'ts')

table.insert(gls.left, {
  GitIcon = {
    provider = function()
      return ' '
    end,
    condition = condition.check_git_workspace,
    separator = ' ',
    separator_highlight = {'NONE', colors.bg},
    highlight = {colors.orange, colors.bg}
  }
})

-- ------------------------------------------------------------------------- }}}
-- {{{ Git branch name

table.insert(gls.left, {
  GitBranch = {
    provider = 'GitBranch',
    condition = condition.check_git_workspace,
    separator = ' ',
    separator_highlight = {'NONE', colors.bg},
    highlight = {colors.orange, colors.bg}
  }
})

-- ------------------------------------------------------------------------- }}}
-- {{{ Git diff add

table.insert(gls.left, {
  DiffAdd = {
    provider = 'DiffAdd',
    condition = condition.hide_in_width,
    icon = '  ',
    highlight = {colors.green, colors.bg}
  }
})

-- ------------------------------------------------------------------------- }}}
-- {{{ Git diff modify

table.insert(gls.left, {
  DiffModified = {
    provider = 'DiffModified',
    condition = condition.hide_in_width,
    icon = ' 柳',
    highlight = {colors.blue, colors.bg}
  }
})

-- ------------------------------------------------------------------------- }}}
-- {{{ Git diff remove

table.insert(gls.left, {
  DiffRemove = {
    provider = 'DiffRemove',
    condition = condition.hide_in_width,
    icon = '  ',
    highlight = {colors.red, colors.bg}
  }
})

-- ------------------------------------------------------------------------- }}}
-- {{{ Diagnostic Error

table.insert(gls.right, {
  DiagnosticError = {
    provider = 'DiagnosticError',
    icon = '  ',
    highlight = {colors.error_red, colors.bg}
  }
})

-- ------------------------------------------------------------------------- }}}
-- {{{ Diagnostic Warning

table.insert(gls.right, {
   DiagnosticWarn = {
     provider = 'DiagnosticWarn',
     icon = '  ',
     highlight = {colors.orange, colors.bg}
   }
})

-- ------------------------------------------------------------------------- }}}
-- {{{ Diagnostic Hint

table.insert(gls.right, {
  DiagnosticHint = {
    provider = 'DiagnosticHint',
    icon = '  ',
    highlight = {colors.vivid_blue, colors.bg}
  }
})

-- ------------------------------------------------------------------------- }}}
-- {{{ Diagnostic Info

table.insert(gls.right, {
  DiagnosticInfo = {
    provider = 'DiagnosticInfo',
    icon = '  ',
    highlight = {colors.info_yellow, colors.bg}
  }
})

-- ------------------------------------------------------------------------- }}}
-- {{{ Treesitter Highlighter

table.insert(gls.right, {
  TreesitterIcon = {
    provider = function()
      if next(treesitter.highlighter.active) ~= nil then return ' ' end
      return ''
    end,
    separator = ' ',
    separator_highlight = {'NONE', colors.bg},
    highlight = {colors.green, colors.bg}
  }
})

-- ------------------------------------------------------------------------- }}}
-- {{{ Dashboard

table.insert(gls.right, {
  ShowLspClient = {
    provider = 'GetLspClient',
    condition = function()
      local tbl = {['dashboard'] = true, [' '] = true}
      if tbl[bo.filetype] then return false end
      return true
    end,
    icon = '  ',
    highlight = {colors.grey, colors.bg}
  }
})

-- ------------------------------------------------------------------------- }}}
-- {{{ Line number and column

table.insert(gls.right, {
  LineInfo = {
    provider = 'LineColumn',
    separator = '  ',
    separator_highlight = {'NONE', colors.bg},
    highlight = {colors.grey, colors.bg}
  }
})

-- ------------------------------------------------------------------------- }}}
-- {{{ Line percent

table.insert(gls.right, {
  PerCent = {
    provider = 'LinePercent',
    separator = ' ',
    separator_highlight = {'NONE', colors.bg},
    highlight = {colors.grey, colors.bg}
  }
})

-- ------------------------------------------------------------------------- }}}
-- {{{ Spacing: 2, 4, 8 who do we appreciate?

table.insert(gls.right, {
  Tabstop = {
    provider = function()
      return "Spaces: " .. api.nvim_buf_get_option(0, "shiftwidth") .. " "
    end,
    condition = condition.hide_in_width,
    separator = ' ',
    separator_highlight = {'NONE', colors.bg},
    highlight = {colors.grey, colors.bg}
  }
})

-- ------------------------------------------------------------------------- }}}
-- {{{ File type

table.insert(gls.right, {
  BufferType = {
    provider = 'FileTypeName',
    condition = condition.hide_in_width,
    separator = ' ',
    separator_highlight = {'NONE', colors.bg},
    highlight = {colors.grey, colors.bg}
  }
})

-- ------------------------------------------------------------------------- }}}
-- {{{ File encoding

table.insert(gls.right, {
  FileEncode = {
    provider = 'FileEncode',
    condition = condition.hide_in_width,
    separator = ' ',
    separator_highlight = {'NONE', colors.bg},
    highlight = {colors.grey, colors.bg}
  }
})

-- ------------------------------------------------------------------------- }}}
-- {{{ Spacing between objects.

table.insert(gls.right, {
  Space = {
    provider = function()
      return ' '
    end,
    separator = ' ',
    separator_highlight = {'NONE', colors.bg},
    highlight = {colors.orange, colors.bg}
  }
})

-- ------------------------------------------------------------------------- }}}
-- {{{ File type name

table.insert(gls.short_line_left, {
  BufferType = {
    provider = 'FileTypeName',
    separator = ' ',
    separator_highlight = {'NONE', colors.bg},
    highlight = {colors.grey, colors.bg}
  }
})

-- ------------------------------------------------------------------------- }}}
-- {{{ SFileName ???

table.insert(gls.short_line_left, {
  SFileName = {
    provider = 'SFileName',
    condition = condition.buffer_not_empty,
    highlight = {colors.grey, colors.bg}
  }
})

-- ------------------------------------------------------------------------- }}}
