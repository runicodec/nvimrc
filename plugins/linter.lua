return {
  "mfussenegger/nvim-lint",
  enabled = true,
  config = function()
    local linter = require("lint")

    linter.linters_by_ft = {
      go = {"golangcilint"}
    }

    vim.api.nvim_create_autocmd({"BufWritePost"}, {
      callback = function()
        linter.try_lint()
      end
    })
  end
}
