if vim.fn.isdirectory(vim.fn.expand("~/Projects/docket-nvim")) == 1 then
  return {
    name = "docket.nvim",
    enabled = true,
    dir = vim.fn.expand("~/Projects/docket-nvim"),
    dev = true,
    keys = {
      {
        "<leader>dg",
        "<cmd>DocketGlobal<cr>",
        desc = "Open the global docket in a full window",
      },
      {
        "<leader>df",
        "<cmd>DocketGlobalFloating<cr>",
        desc = "Open the global docket in a floating window (closed with Esc)",
      },
    },
  }
else
  return {
    "runicodec/docket.nvim",
    enabled = true,
    keys = {
      {
        "<leader>dg",
        "<cmd>DocketGlobal<cr>",
        desc = "Open the global docket in a full window",
      },
      {
        "<leader>df",
        "<cmd>DocketGlobalFloating<cr>",
        desc = "Open the global docket in a floating window (closed with Esc)",
      },
    },
  }
end
