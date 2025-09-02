return {
  {
    "neovim/nvim-lspconfig",
    config = function()
      local lspconfig = require("lspconfig")
      local capabilities = require("cmp_nvim_lsp").default_capabilities()
      local lsp_flags = { debounce_text_changes = 80 }

      -- optional: require lsp_signature ONCE if you want it everywhere
      local lsp_signature = require("lsp_signature")

      local on_attach = function(client, bufnr)
        -- Attach lsp_signature (comment this out if you want to disable)
        lsp_signature.on_attach({
          bind = true,
          handler_opts = { border = "rounded" },
          hint_enable = true,
          hint_prefix = " ",
          floating_window = true,
          floating_window_above_cur_line = true,
        }, bufnr)
      end

      -- Common opts
      local opts = {
        on_attach = on_attach,
        capabilities = capabilities,
        flags = lsp_flags,
      }

      -- Configure servers
      lspconfig.ts_ls.setup(opts)
      lspconfig.pyright.setup(opts)
      lspconfig.lua_ls.setup(opts)
      lspconfig.html.setup(opts)
    end,
  },
}

