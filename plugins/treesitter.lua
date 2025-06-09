return {
  "nvim-treesitter/nvim-treesitter",
  enabled = true,
  opts = {
    ensure_installed = { 
      "c", 
      "cpp",
      "rust",
      "zig",
      "go",
      "java",
      "lua", 
      "python",
      "bash",
      "markdown",
      "markdown_inline",
      "html",
      "typst",
      "yaml",
    },

    highlight = {
      enable = true,
    },
  },
  build = ":TSUpdate",
}
