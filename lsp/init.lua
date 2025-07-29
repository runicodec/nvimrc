local M = {}

-- lsp configuration
require("codec.lsp.config")

-- lsps
require("codec.lsp.providers.gopls")

vim.lsp.enable({
  "gopls",
})

return M
