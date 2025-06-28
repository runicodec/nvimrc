if vim.fn.isdirectory(vim.fn.expand("~/Projects/glacier.nvim")) == 1 then
  return {
    name = "glacier.nvim",
    enabled = true,
    dir = vim.fn.expand("~/Projects/glacier.nvim"),
    dev = true,
  }
else
  return {
    "runicodec/glacier.nvim",
    enabled = true,
  }
end
