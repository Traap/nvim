-- {{{ Credits

-- https://github.com/LunarVim/Neovim-from-scratch

-- ------------------------------------------------------------------------- }}}
-- {{{ Use protected call so we don't error on first use.

local  status_ok, alpha = pcall(require, "alpha")
if not status_ok then return end

-- ------------------------------------------------------------------------- }}}

local dashboard = require("alpha.themes.dashboard")
dashboard.section.header.val = {
  [[                               __                ]],
  [[  ___     ___    ___   __  __ /\_\    ___ ___    ]],
  [[ / _ `\  / __`\ / __`\/\ \/\ \\/\ \  / __` __`\  ]],
  [[/\ \/\ \/\  __//\ \_\ \ \ \_/ |\ \ \/\ \/\ \/\ \ ]],
  [[\ \_\ \_\ \____\ \____/\ \___/  \ \_\ \_\ \_\ \_\]],
  [[ \/_/\/_/\/____/\/___/  \/__/    \/_/\/_/\/_/\/_/]],
}

dashboard.section.buttons.val = {
  dashboard.button("a", "  Alpha",               ":e ~/.config/nvim/lua/traap/alpha/init.lua <CR>"),
  dashboard.button("b", "  bspwm",               ":e ~/.config/bspwm/bspwmrc <CR>"),
  dashboard.button("c", "  Configuration",       ":e ~/.config/nvim/init.lua <CR>"),
  dashboard.button("e", "  New file",            ":ene <BAR> startinsert <CR>"),
  dashboard.button("f", "  Find file",           ":Telescope find_files <CR>"),
  dashboard.button("k", "  Keybindings",         ":e~/git/nvim/lua/traap/keybindings/init.lua<CR>"),
  dashboard.button("n", "  Notebook",            ":e ~/git/wiki/index.md<CR>"),
  dashboard.button("p", "  Plugins",             ":e ~/.config/nvim/lua/traap/plugins/init.lua <CR>"),
  dashboard.button("q", "  Quit Neovim",         ":qa<CR>"),
  dashboard.button("r", "  Recently used files", ":Telescope oldfiles <CR>"),
  dashboard.button("s", "  sxhkd",               ":e ~/.config/sxhkd/sxhkdrc <CR>"),
  dashboard.button("t", "  Find text",           ":Telescope live_grep <CR>"),
  dashboard.button("v", "  Resume",              ":e ~/git/wiki/personal/cv/cv.tex<CR>"),
  dashboard.button("w", "  WhichKey",            ":e ~/git/nvim/lua/traap/which-key/init.lua<CR>"),
}

local function footer()
  -- NOTE: requires the fortune-mod package to work
  -- local handle = io.popen("fortune")
  -- local fortune = handle:read("*a")
  -- handle:close()
  -- return fortune
  return "Https://GitHub.com/Traap/nvim"
end

dashboard.section.footer.val = footer()

dashboard.section.footer.opts.hl = "Type"
dashboard.section.header.opts.hl = "Include"
dashboard.section.buttons.opts.hl = "Keyword"

dashboard.opts.opts.noautocmd = true
alpha.setup(dashboard.opts)
