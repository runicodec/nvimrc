return {
  "NeogitOrg/neogit",

  enabled = true,

  dependencies = {
    "nvim-lua/plenary.nvim",         -- required
    "sindrets/diffview.nvim",        -- optional - Diff integration

    "nvim-telescope/telescope.nvim", -- optional
  },

  config = function()
    local neogit = require("neogit")

    -- configure neogit
    neogit.setup({
      kind = "replace",

      -- set up line numbering & overwrite numbered commands
      disable_line_numbers = false,
      disable_relative_line_numbers = false,

      mappings = {
        status = {
          -- disable the original numbered commands
          ["1"] = false,  -- Depth1
          ["2"] = false,  -- Depth2
          ["3"] = false,  -- Depth3
          ["4"] = false,  -- Depth4
          -- assign the numbered commands to a corresponding <c-number> binding
          ["<c-1>"] = "Depth1",
          ["<c-2>"] = "Depth2",
          ["<c-3>"] = "Depth3",
          ["<c-4>"] = "Depth4",
        },
      },
    })

    -- keybind
    vim.keymap.set("n", "<leader>mg", function()
      neogit.open()
    end)
  end
}
