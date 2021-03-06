-- {{{ Bail when required packages are not loaded.

local  devicons_ok, devicons = pcall(require, 'nvim-web-devicons')
if not devicons_ok then return end

-- ------------------------------------------------------------------------- }}}
-- {{{ Setup icons with nvim-web-devicons.
--
-- See: https://github.com/siduck76/NvChad for additional aspiration

devicons.setup {
  override = {
    Dockerfile = {icon = "",  color = "#b8b5ff", name = "Dockerfile"},
    css        = {icon = "",  color = "#61afef", name = "css"},
    deb        = {icon = "",  color = "#a3b8ef", name = "deb"},
    html       = {icon = "",  color = "#DE8C92", name = "html"},
    jpeg       = {icon = " ", color = "#BD77DC", name = "jpeg"},
    jpg        = {icon = " ", color = "#BD77DC", name = "jpg"},
    js         = {icon = "",  color = "#EBCB8B", name = "js"},
    kt         = {icon = "󱈙",  color = "#ffcb91", name = "kt"},
    lock       = {icon = "",  color = "#DE6B74", name = "lock"},
    md         = {icon = "",  color = "#b8b5ff", name = "mp3"},
    mp3        = {icon = "",  color = "#C8CCD4", name = "mp3"},
    mp4        = {icon = "",  color = "#C8CCD4", name = "mp4"},
    out        = {icon = "",  color = "#C8CCD4", name = "out"},
    png        = {icon = " ", color = "#BD77DC", name = "png"},
    py         = {icon = "",  color = "#a7c5eb", name = "py"},
    rb         = {icon = "",  color = "#ff75a0", name = "rb"},
    rpm        = {icon = "",  color = "#fca2aa", name = "rpm"},
    toml       = {icon = "",  color = "#61afef", name = "toml"},
    ts         = {icon = "ﯤ",  color = "#519ABA", name = "ts"},
    vue        = {icon = "﵂",  color = "#7eca9c", name = "vue"},
    xz         = {icon = "",  color = "#EBCB8B", name = "xz"},
    yaml       = {icon = "",  color = "#EBCB8B", name = "xz"},
    zip        = {icon = "",  color = "#EBCB8B", name = "zip"}
  };
}

-- ------------------------------------------------------------------------- }}}
