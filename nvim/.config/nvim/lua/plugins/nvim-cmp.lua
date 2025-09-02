return {
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",    -- LSP completion
      "hrsh7th/cmp-buffer",      -- Buffer completion
      "hrsh7th/cmp-path",        -- Path completion
      "hrsh7th/cmp-cmdline",     -- Cmdline completion
      "hrsh7th/vim-vsnip",       -- Snippet engine (VSnip)
      "hrsh7th/cmp-vsnip",       -- VSnip source for nvim-cmp
    },
    config = function()
      -- Load cmp
      local cmp = require("cmp")

      cmp.setup({
        snippet = {
          expand = function(args)
            vim.fn["vsnip#anonymous"](args.body) -- Use VSnip for snippet expansion
          end,
        },
        window = {
          -- Uncomment if you want borders around the completion menu/documentation
          -- completion = cmp.config.window.bordered(),
          -- documentation = cmp.config.window.bordered(),
        },
        mapping = cmp.mapping.preset.insert({
          ["<C-b>"] = cmp.mapping.scroll_docs(-4),
          ["<C-f>"] = cmp.mapping.scroll_docs(4),
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<C-e>"] = cmp.mapping.abort(),
          ["<CR>"] = cmp.mapping.confirm({ select = true }),
        }),
        sources = cmp.config.sources({
          { name = "nvim_lsp" },
          { name = "vsnip" }, -- Snippet support
        }, {
          { name = "buffer" }, -- Buffer completions
        }),
      })

      -- Set up cmdline completion
      cmp.setup.cmdline({ "/", "?" }, {
        mapping = cmp.mapping.preset.cmdline(),
        sources = {
          { name = "buffer" },
        },
      })

      cmp.setup.cmdline(":", {
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources({
          { name = "path" }, -- File path completions
        }, {
          { name = "cmdline" }, -- Command-line completions
        }),
      })

      -- LSP capabilities
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      -- Example LSP setup (replace `<YOUR_LSP_SERVER>` with actual LSP names)
      --local lspconfig = require("lspconfig")
      --lspconfig.ts_ls.setup { capabilities = capabilities }
      --lspconfig.lua_ls.setup { capabilities = capabilities }
    end,
  },
}

