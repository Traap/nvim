-- {{{ Alias to vim APis.

local        vim = vim
local          g = vim.g
local        cmd = vim.cmd
local        env = vim.env
local        opt = vim.opt
local       trim = vim.fn.trim
local     system = vim.fn.system
local substitute = vim.fn.substitute

-- ------------------------------------------------------------------------- }}}
-- {{{ Archlinux and Windows Subsystem for Linux check

local uname = {
  arch      = trim(system("cat /etc/issue | rg 'Arch Linux' -c")),
  kernel    = trim(system('uname -s')),
  node      = trim(system('uname -n')),
  release   = trim(system('uname -r')),
  version   = trim(system('uname -v')),
  machine   = trim(system('uname -m')),
  processor = trim(system('uname -p')),
  hardware  = trim(system('uname -i')),
  os        = trim(system('uname -o')),
  wsl       = false
}

if string.find(string.lower(uname.release),'wsl2') or
   string.find(string.lower(uname.release),'microsoft') then
  uname.wsl = true
end

g.uname = uname


-- ------------------------------------------------------------------------- }}}
