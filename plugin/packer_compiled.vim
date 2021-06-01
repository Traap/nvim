" Automatically generated packer.nvim plugin loader code

if !has('nvim-0.5')
  echohl WarningMsg
  echom "Invalid Neovim version for packer.nvim!"
  echohl None
  finish
endif

packadd packer.nvim

try

lua << END
  local time
  local profile_info
  local should_profile = false
  if should_profile then
    local hrtime = vim.loop.hrtime
    profile_info = {}
    time = function(chunk, start)
      if start then
        profile_info[chunk] = hrtime()
      else
        profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
      end
    end
  else
    time = function(chunk, start) end
  end
  
local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end

  _G._packer = _G._packer or {}
  _G._packer.profile_output = results
end

time("Luarocks path setup", true)
local package_path_str = "/home/gary/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/home/gary/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/home/gary/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/home/gary/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/home/gary/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time("Luarocks path setup", false)
time("try_loadstring definition", true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s))
  if not success then
    print('Error running ' .. component .. ' for ' .. name)
    error(result)
  end
  return result
end

time("try_loadstring definition", false)
time("Defining packer_plugins", true)
_G.packer_plugins = {
  ["base16-vim"] = {
    loaded = true,
    path = "/home/gary/.local/share/nvim/site/pack/packer/start/base16-vim"
  },
  ["completion-nvim"] = {
    loaded = true,
    path = "/home/gary/.local/share/nvim/site/pack/packer/start/completion-nvim"
  },
  ["galaxyline.nvim"] = {
    loaded = true,
    path = "/home/gary/.local/share/nvim/site/pack/packer/start/galaxyline.nvim"
  },
  neoformat = {
    loaded = true,
    path = "/home/gary/.local/share/nvim/site/pack/packer/start/neoformat"
  },
  ["nlua.nvim"] = {
    loaded = true,
    path = "/home/gary/.local/share/nvim/site/pack/packer/start/nlua.nvim"
  },
  ["nvim-base16.lua"] = {
    loaded = true,
    path = "/home/gary/.local/share/nvim/site/pack/packer/start/nvim-base16.lua"
  },
  ["nvim-compe"] = {
    loaded = true,
    path = "/home/gary/.local/share/nvim/site/pack/packer/start/nvim-compe"
  },
  ["nvim-lspconfig"] = {
    loaded = true,
    path = "/home/gary/.local/share/nvim/site/pack/packer/start/nvim-lspconfig"
  },
  ["nvim-lspinstall"] = {
    loaded = true,
    path = "/home/gary/.local/share/nvim/site/pack/packer/start/nvim-lspinstall"
  },
  ["nvim-tree.lua"] = {
    loaded = true,
    path = "/home/gary/.local/share/nvim/site/pack/packer/start/nvim-tree.lua"
  },
  ["nvim-treesitter"] = {
    loaded = true,
    path = "/home/gary/.local/share/nvim/site/pack/packer/start/nvim-treesitter"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/home/gary/.local/share/nvim/site/pack/packer/start/nvim-web-devicons"
  },
  ["packer.nvim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/gary/.local/share/nvim/site/pack/packer/opt/packer.nvim"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/home/gary/.local/share/nvim/site/pack/packer/start/plenary.nvim"
  },
  ["popup.nvim"] = {
    loaded = true,
    path = "/home/gary/.local/share/nvim/site/pack/packer/start/popup.nvim"
  },
  ["snippets.nvim"] = {
    loaded = true,
    path = "/home/gary/.local/share/nvim/site/pack/packer/start/snippets.nvim"
  },
  ["startuptime.vim"] = {
    loaded = true,
    path = "/home/gary/.local/share/nvim/site/pack/packer/start/startuptime.vim"
  },
  ["telescope-media-files.nvim"] = {
    loaded = true,
    path = "/home/gary/.local/share/nvim/site/pack/packer/start/telescope-media-files.nvim"
  },
  ["telescope-snippets.nvim"] = {
    loaded = true,
    path = "/home/gary/.local/share/nvim/site/pack/packer/start/telescope-snippets.nvim"
  },
  ["telescope.nvim"] = {
    loaded = true,
    path = "/home/gary/.local/share/nvim/site/pack/packer/start/telescope.nvim"
  },
  ["vim-commentary"] = {
    loaded = true,
    path = "/home/gary/.local/share/nvim/site/pack/packer/start/vim-commentary"
  },
  ["vim-dispatch"] = {
    loaded = true,
    path = "/home/gary/.local/share/nvim/site/pack/packer/start/vim-dispatch"
  },
  ["vim-easy-align"] = {
    loaded = true,
    path = "/home/gary/.local/share/nvim/site/pack/packer/start/vim-easy-align"
  },
  ["vim-endwise"] = {
    loaded = true,
    path = "/home/gary/.local/share/nvim/site/pack/packer/start/vim-endwise"
  },
  ["vim-fugitive"] = {
    loaded = true,
    path = "/home/gary/.local/share/nvim/site/pack/packer/start/vim-fugitive"
  },
  ["vim-ripgrep"] = {
    loaded = true,
    path = "/home/gary/.local/share/nvim/site/pack/packer/start/vim-ripgrep"
  },
  ["vim-surround"] = {
    loaded = true,
    path = "/home/gary/.local/share/nvim/site/pack/packer/start/vim-surround"
  },
  ["vim-unimpaired"] = {
    loaded = true,
    path = "/home/gary/.local/share/nvim/site/pack/packer/start/vim-unimpaired"
  },
  vimtex = {
    loaded = true,
    path = "/home/gary/.local/share/nvim/site/pack/packer/start/vimtex"
  },
  ["wiki-ft.vim"] = {
    loaded = true,
    path = "/home/gary/.local/share/nvim/site/pack/packer/start/wiki-ft.vim"
  },
  ["wiki.vim"] = {
    loaded = true,
    path = "/home/gary/.local/share/nvim/site/pack/packer/start/wiki.vim"
  }
}

time("Defining packer_plugins", false)
if should_profile then save_profiles() end

END

catch
  echohl ErrorMsg
  echom "Error in packer_compiled: " .. v:exception
  echom "Please check your config for correctness"
  echohl None
endtry
