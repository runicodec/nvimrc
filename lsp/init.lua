local M = {}

-- lsp configuration
require("codec.lsp.config")

-- lsps
require("codec.lsp.providers.gopls")
require("lsp.providers.lua_ls")

vim.lsp.enable({
  "gopls",
  "lua_language_server",
})

return M
