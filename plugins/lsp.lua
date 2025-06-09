-- Check out williamboman/mason-lspconfig.nvim for more details
-- on how to configure these LSPs.
return {
  "neovim/nvim-lspconfig",

  enabled = true,

  dependencies = {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    {
      "folke/lazydev.nvim",
      ft = "lua", -- only load on lua files
      opts = {
        library = {
          -- See the configuration section for more details
          -- Load luvit types when the `vim.uv` word is found
          { path = "${3rd}/luv/library", words = { "vim%.uv" } },
        },
      },
    },
    {
      "hrsh7th/nvim-cmp",
      dependencies = {
        "hrsh7th/cmp-nvim-lsp",
        "L3MON4D3/LuaSnip",
        "saadparwaiz1/cmp_luasnip",
      },
      event = "InsertEnter",
      opts = function(_, opts)
        opts.sources = opts.sources or {}
        table.insert(opts.sources, {
          name = "lazydev",
          group_index = 0, -- set group index to 0 to skip loading LuaLS completions
        })
      end,
      config = function()
        local cmp = require("cmp")
        local luasnip = require("luasnip")

        cmp.setup({
          snippet = {
            expand = function()
              luasnip.lsp_expand(args.body)
            end,
          },
          mapping = cmp.mapping.preset.insert({
            ["<Tab>"] = cmp.mapping.select_next_item(),
            ["<C-Tab>"] = cmp.mapping.select_prev_item(),
            ["<CR>"] = cmp.mapping.confirm({ select = true }),
            ["<C-Space>"] = cmp.mapping.complete(),
          }),
          sources = cmp.config.sources({ -- already set in opts
            { name = "nvim_lsp" },
            { name = "luasnip " },
          }),
        })
      end,
    },
    {
      "saghen/blink.cmp",
      opts = {
        fuzzy = {
          implementation = "lua",
        },
        sources = {
          -- add lazydev to your completion providers
          default = { "lazydev", "lsp", "path", "snippets", "buffer" },
          providers = {
            lazydev = {
              name = "LazyDev",
              module = "lazydev.integrations.blink",
              -- make lazydev completions top priority (see `:h blink.cmp`)
              score_offset = 100,
            },
          },
        },
      },
    },
  },

  config = function()
    local mason = require("mason")
    local masonLspconfig = require("mason-lspconfig")

    mason.setup()
    masonLspconfig.setup({
      ensure_installed = {
        "lua_ls",
        --"rust_analyzer",
        "clangd",
        --"gopls",
        --"pylsp",
        "pyright",
      },
      automatic_enable = nil,
    })

    local lspconfig = require("lspconfig")
    local capabilities = require("cmp_nvim_lsp").default_capabilities()

    lspconfig.pyright.setup({
      capabilities = capabilities,
    })

    lspconfig.lua_ls.setup({
      capabilities = capabilities,
    })

    -- set up language servers
    --require("lspconfig").lua_ls.setup({})
    --require("lspconfig").rust_analyzer.setup({}) -- requires rust_analyzer binary
    --require("lspconfig").clangd.setup({})
    --require("lspconfig").gopls.setup({})         -- requires gopls binary
    --require("lspconfig").pylsp.setup({})
  end,
}
