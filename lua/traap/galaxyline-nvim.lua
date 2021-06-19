local gl = require('galaxyline')
local condition = require('galaxyline.condition')
local gls = gl.section
local fn = vim.fn

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

local checkwidth = function()
  local squeeze_width = fn.winwidth(0) / 2
  if squeeze_width > 30 then return true end
  return false
end

gls.left[1] = {
  statusIcon = {
    provider = function() return "   " end,
    highlight = {colors.bg, colors.blue},
    separator = "",
    separator_highlight = {colors.blue, colors.lightbg}
  }
}

gls.left[2] = {
  ViMode = {
    provider = function()
      -- auto change color according the vim mode
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
      vim.api.nvim_command('hi GalaxyViMode guifg=' .. mode_color[vim.fn.mode()])
      --  color mode alias
      local alias = {
        n      = "Normal ",
        i      = "Insert ",
        c      = "Command",
        V      = "Visual ",
        [""] = "Visual ",
        v      = "Visual ",
        R      = "Replace"
      }
      local current_Mode = alias[fn.mode()]
      if current_Mode == nil then
        return "  Terminal "
      else
        return " " .. current_Mode .. " "
      end
    end,
    highlight = {colors.red, colors.lightbg}
  }
}

gls.left[3] = {
  FileIcon = {
    provider = "FileIcon",
    condition = condition.buffer_not_empty,
    highlight = {colors.fg, colors.lightbg}
  }
}

gls.left[4] = {
  FileName = {
    provider = {"FileName"},
    condition = condition.buffer_not_empty,
    highlight = {colors.fg, colors.lightbg},
    separator = " ",
    separator_highlight = {colors.lightbg, colors.bg}
  }
}

gls.left[5] = {
  DiffAdd = {
    provider = "DiffAdd",
    condition = checkwidth,
    icon = "  ",
    highlight = {colors.fg, colors.bg}
  }
}

gls.left[6] = {
  DiffModified = {
    provider = "DiffModified",
    condition = checkwidth,
    icon = "   ",
    highlight = {colors.grey, colors.bg}
  }
}

gls.left[7] = {
  DiffRemove = {
    provider = "DiffRemove",
    condition = checkwidth,
    icon = "  ",
    highlight = {colors.grey, colors.bg}
  }
}

gls.left[8] = {
  DiagnosticError = {
    provider = "DiagnosticError",
    icon = "  ",
    highlight = {colors.grey, colors.bg}
  }
}

gls.left[9] = {
  DiagnosticWarn = {
    provider = "DiagnosticWarn",
    icon = "  ",
    highlight = {colors.yellow, colors.bg}
  }
}

gls.right[1] = {
  GitIcon = {
    provider = function() return " " end,
    condition = require("galaxyline.provider_vcs").check_git_workspace,
    highlight = {colors.grey, colors.lightbg},
    separator = "",
    separator_highlight = {colors.lightbg, colors.bg}
  }
}

gls.right[2] = {
  GitBranch = {
    provider = "GitBranch",
    condition = require("galaxyline.provider_vcs").check_git_workspace,
    highlight = {colors.grey, colors.lightbg}
  }
}

gls.right[3] = {
  viMode_icon = {
    provider = function() return " " end,
    highlight = {colors.bg, colors.red},
    separator = " ",
    separator_highlight = {colors.red, colors.lightbg}
  }
}


gls.right[5] = {
  time_icon = {
    provider = function() return " " end,
    separator = "",
    separator_highlight = {colors.green, colors.bg},
    highlight = {colors.lightbg, colors.green}
  }
}

gls.right[6] = {
  time = {
    provider = function() return "  " .. os.date("%H:%M") .. " " end,
    highlight = {colors.green, colors.lightbg}
  }
}
