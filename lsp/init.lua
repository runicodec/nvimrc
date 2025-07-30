local M = {}

-- lsp configuration
require("codec.lsp.config")

-- lsps
require("codec.lsp.providers.gopls")
require("codec.lsp.providers.lua-language-server")

vim.lsp.enable({
  "gopls",
  "lua_language_server",
})

return M
