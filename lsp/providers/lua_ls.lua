local M = {}

vim.lsp.config.lua_language_server = {
  cmd = {
    "lua-language-server",
  },
  root_markers = { 
    "init.lua",
  },
  filetypes = {
    "lua",
  },
}

return M
