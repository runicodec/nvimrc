local function is_windows()
  return vim.loop.os_uname().sysname == "Windows_NT"
end

return {
  "yetone/avante.nvim",
  enabled = true,
  event = "VeryLazy",
  lazy = false,
  version = false,
  opts = {
    providers = {
      openai = {
        model = "gpt-4o"
      },

      claude = {
        model = "claude-3-5-sonnet-20241022"
      },
    },

    provider = "claude",
  },
  -- Dynamically set the build command based on OS
  build = is_windows() and
    "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false" or
    "make",
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "stevearc/dressing.nvim",
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
    "nvim-tree/nvim-web-devicons",
    "zbirenbaum/copilot.lua",
    {
      "HakonHarnes/img-clip.nvim",
      event = "VeryLazy",
      opts = {
        default = {
          embed_image_as_base64 = false,
          prompt_for_file_name = false,
          drag_and_drop = {
            insert_mode = true,
          },
          use_absolute_path = true,
        },
      },
    },
    {
      'MeanderingProgrammer/render-markdown.nvim',
      opts = {
        file_types = { "markdown", "Avante" },
      },
      ft = { "markdown", "Avante" },
    },
  },
}
