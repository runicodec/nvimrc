local M = {}

---@type DiagnosticConfig
local diag_config = {
  virtual_text = nil,
  virtual_lines = { current_line = true }
}

vim.diagnostic.config(diag_config)

return M
