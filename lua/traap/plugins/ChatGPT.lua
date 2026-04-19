local platform = require("traap.core.platform")

local function read_codex_auth_key()
  local auth_path = vim.fn.expand("~/.codex/auth.json")

  if vim.fn.filereadable(auth_path) ~= 1 then
    return vim.env.OPENAI_API_KEY
  end

  local ok, lines = pcall(vim.fn.readfile, auth_path)
  if not ok then
    return vim.env.OPENAI_API_KEY
  end

  local decoded_ok, auth = pcall(vim.json.decode, table.concat(lines, "\n"))
  if not decoded_ok or type(auth) ~= "table" then
    return vim.env.OPENAI_API_KEY
  end

  if type(auth.OPENAI_API_KEY) == "string" and auth.OPENAI_API_KEY ~= "" then
    return auth.OPENAI_API_KEY
  end

  local tokens = auth.tokens
  if
      type(tokens) == "table"
      and type(tokens.access_token) == "string"
      and tokens.access_token ~= ""
  then
    return tokens.access_token
  end

  return vim.env.OPENAI_API_KEY
end

return {
  "jackMort/ChatGPT.nvim",

  dependencies = {
    "MunifTanjim/nui.nvim",
    "nvim-lua/plenary.nvim",
    "folke/trouble.nvim",
    "nvim-telescope/telescope.nvim",
  },

  enabled = true and platform.is_nvim(),

  cmd = {
    "ChatGPT",
    "ChatGPTActAs",
    "ChatGPTEditWithInstructions",
    "ChatGPTRun",
    "ChatGPTCompleteCode",
  },

  config = function()
    local codex_model = vim.env.OPENAI_CODEX_MODEL or "gpt-5.2-codex"
    local openai_api_key = read_codex_auth_key()

    if openai_api_key and openai_api_key ~= "" then
      vim.env.OPENAI_API_KEY = openai_api_key
    end

    require("chatgpt").setup({
      chat = {
        default_system_message =
        "You are Codex, a pragmatic coding assistant. Focus on code changes, debugging, tests, and concise technical answers.",
      },
      openai_params = {
        model = codex_model,
      },
      openai_edit_params = {
        model = codex_model,
      },
    })
  end,
}
