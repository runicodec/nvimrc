return {
  'stevearc/oil.nvim',
  enabled = true,
  ---@module 'oil'
  ---@type oil.SetupOpts
  opts = {},
  dependencies = {
    { "nvim-tree/nvim-web-devicons" }
  },
  keys = {
    {
      "<leader>pf",
      "<cmd>Oil<cr>",
      mode = "",
      desc = "Open Oil",
    },
  },
  config = function()
    require("oil").setup({
      keymaps = {
        ["<C-h>"] = false,
      },
    })
  end,
  -- TODO: revisit after project selector has been rewritten
  --config = function()
  --  require("oil").setup()

  --  require("codec.custom.project_selector").setup({
  --    file_browser = "Oil"
  --  })
  --end,
  -- Lazy loading is not recommended because it is very tricky to make it work correctly in all situations.
  lazy = false,
}
