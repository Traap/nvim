-- Initialize Installed Language Servers
--
-- https://github.com/kabouzied/nvim-lspinstall/wiki

-- {{{ Step 0: A functions activate keymaps and enables snippet support

local function make_config()
  local capabilities = vim.lsp.protocol.make_client_capabilities()
  capabilities.textDocument.completion.completionItem.snippetSupport = true
  return {
    -- enable snippet support
    capabilities = capabilities,
    -- map buffer local keybindings when the language server attaches
    on_attach = on_attach,
  }
end

-- ------------------------------------------------------------------------- }}}
-- {{{ Step 1: A function to Setup language servers

local function setup_servers()
  require'lspinstall'.setup()
  local servers = require'lspinstall'.installed_servers()
  for _, server in pairs(servers) do
    local config = make_config()
    config.settings = lua_settings
    require'lspconfig'[server].setup(config)
  end
end

-- ------------------------------------------------------------------------- }}}
-- {{{ Step 2: Configure lua language server for neovim development

local lua_settings = {
  Lua = {
    runtime = {
      -- LuaJIT in the case of Neovim
      version = 'LuaJIT',
      path = vim.split(package.path, ';'),
    },
    diagnostics = {
      -- Get the language server to recognize the `vim` global
      globals = {'vim'},
    },
    workspace = {
      -- Make the server aware of Neovim runtime files
      library = {
        [vim.fn.expand('$VIMRUNTIME/lua')] = true,
        [vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true,
      },
    },
  }
}

-- ------------------------------------------------------------------------- }}}
-- {{{ Step 3: call the setup function

setup_servers()

-- ------------------------------------------------------------------------- }}}
-- {{{ Step 4: Automaticall reload after `:LspInstall <server>` to avoid
--             restarting neovim.

require'lspinstall'.post_installation_hook = function ()
  setup_servers()        -- reload
  vim.cmd('bufdo e')     -- Trigger FileType autocmd to start servers 
end

-- ------------------------------------------------------------------------- }}}
-- {{{ Step 5: Assign keybindings when a lanaguage server attaches. 

local on_attach = function(client, bufnr)
  local function keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  local opts = { noremap=true, silent=true }

  keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  keymap('n', '<leader>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  keymap('n', '<leader>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
  keymap('n', '<leader>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
  keymap('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  keymap('n', '<leader>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  keymap('n', '<leader>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  keymap('n', '<leader>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
  keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
  keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
  keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
  keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)

  -- Set some keybinds conditional on server capabilities
  if client.resolved_capabilities.document_formatting then
    keymap("n", "<leader>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
  elseif client.resolved_capabilities.document_range_formatting then
    keymap("n", "<leader>f", "<cmd>lua vim.lsp.buf.range_formatting()<CR>", opts)
  end

  -- Set autocommands conditional on server_capabilities
  if client.resolved_capabilities.document_highlight then
    vim.api.nvim_exec([[
    augroup lsp_document_highlight
    autocmd! * <buffer>
    autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
    autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
    augroup END
    ]], false)
  end

  -- luagg
end

-- ------------------------------------------------------------------------- }}}
-- {{{ Step 6: Replace default diagnostics with prettier symbols. 

local sign_define = vim.fn.sign_define

sign_define("LspDiagnosticsSignError",
            {text = "", numhl = "LspDiagnosticsDefaultError"})

sign_define("LspDiagnosticsSignWarning",
            {text = "", numhl = "LspDiagnosticsDefaultWarning"})

sign_define("LspDiagnosticsSignInformation",
           {text = "", numhl = "LspDiagnosticsDefaultInformation"})

sign_define("LspDiagnosticsSignHint",
           {text = "", numhl = "LspDiagnosticsDefaultHint"})

-- ------------------------------------------------------------------------- }}}
