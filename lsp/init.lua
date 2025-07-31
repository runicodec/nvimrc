local M = {}

-- lsp configuration
require("codec.lsp.config")

-- load lsps
local providers = require("codec.lsp.providers")
require("codec.lsp.loader").load(providers)

return M
