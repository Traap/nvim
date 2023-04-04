-- {{{ Bail when requried packages are not loaded.q

local telescope_ok, telescope = pcall(require, "telescope")
if not telescope_ok then
  return
end

-- ------------------------------------------------------------------------- }}}
-- {{{ Use defaults or customzie this plugin.

local customize = require("traap.core.customize").telescope
if not customize then
  telescope.setup()
  return
end

-- --------------------------------------------------------------------------}}}
-- {{{ Telescope mappings (keybindings)

local actions = require("telescope.actions")

local mappings = {
  n = {
    ["<esc>"] = actions.close,
    ["<CR>"] = actions.select_default,

    ["<C-x>"] = actions.select_horizontal,
    ["<C-v>"] = actions.select_vertical,
  },
}

-- --------------------------------------------------------------------------}}}
-- {{{ Telescope layout_config

local layout_config = { prompt_position = "top" }

local layout_strategy = "horizontal"

-- --------------------------------------------------------------------------}}}
-- {{{ Telescope ripgrep setup.

local vimgrep_arguments = {
  "rg",
  "--color=never",
  "--column",
  "--line-number",
  "--no-heading",
  "--smart-case",
  "--with-filename",
}

-- --------------------------------------------------------------------------}}}
-- {{{ Telescope file_ignore_patterns

local file_ignore_patterns = {
  "%.7z",
  "%.burp",
  "%.bz2",
  "%.cache",
  "%.class",
  "%.dll",
  "%.docx",
  "%.dylib",
  "%.epub",
  "%.exe",
  "%.flac",
  "%.ico",
  "%.ipynb",
  "%.jar",
  "%.lock",
  "%.met",
  "%.mkv",
  "%.mp4",
  "%.otf",
  "%.pdb",
  "%.pdf",
  "%.rar",
  "%.sqlite3",
  "%.svg",
  "%.tar",
  "%.tar.gz",
  "%.ttf",
  "%.webp",
  "%.zip",
  ".dart_tool/",
  ".git/",
  ".github/",
  ".gradle/",
  ".idea/",
  ".settings/",
  ".vale/",
  ".vscode/",
  "__pycache__/",
  "__pycache__/*",
  "build/",
  "docs/",
  "env/",
  "gradle/",
  "node_modules/",
  "node_modules/*",
  "smalljre_*/*",
  "spell/*",
  "target/",
  "vendor/*",
}

-- --------------------------------------------------------------------------}}}
-- {{{ Telescope defaults

local defaults = {
  border = {},

  borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },

  buffer_previewer_maker = require("telescope.previewers").buffer_previewer_maker,
  color_devicons = true,
  entry_prefix = "  ",
  file_ignore_patterns = file_ignore_patterns,
  file_previewer = require("telescope.previewers").vim_buffer_cat.new,
  file_sorter = require("telescope.sorters").get_fuzzy_file,
  generic_sorter = require("telescope.sorters").get_generic_fuzzy_sorter,
  grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
  initial_mode = "insert",
  layout_config = layout_config,
  layout_strategy = layout_strategy,
  mappings = mappings,
  path_display = { "smart" },
  pickers = { colorscheme = { enable_preview = true } },
  prompt_prefix = " ",
  qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,
  selection_caret = " ",
  selection_strategy = "reset",
  set_env = { ["COLORTERM"] = "truecolor" },
  sorting_strategy = "descending",
  use_less = true,
  vimgrep_arguments = vimgrep_arguments,
  winblend = 0,
}

-- ------------------------------------------------------------------------- }}}
-- {{{ Telescope extensions.

local extensions = {
  fzf = {
    fuzzy = true,
    override_generic_sorter = true,
    override_file_sorter = true,
    case_mode = "smart_case",
  },
  media_files = {
    filetypes = { "pdf", "png", "webp", "jpg", "jpeg" },
    find_cmd = "rg",
  },
}

-- ------------------------------------------------------------------------- }}}
-- {{{ Telescope setup.

telescope.setup({
  defaults = defaults,
  extensions = extensions,
})

-- ------------------------------------------------------------------------- }}}
-- {{{ Load extensions.

-- telescope.load_extension "media_files"

local ext_names = {
  "fzf",
  "luasnip",
  "media_files",
  "notify",
}

for _, name in ipairs(ext_names) do
  telescope.load_extension(name)
end

-- ------------------------------------------------------------------------- }}}
