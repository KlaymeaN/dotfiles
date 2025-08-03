return {
  {
    "neovim/nvim-lspconfig",
    config = function()
      -- Example LSP server setup (replace with your own)
      local lspconfig = require("lspconfig")
      local lsp_signature = require("lsp_signature")
      local on_attach = function(client, bufnr)
        -- Attach lsp_signature to each LSP
        lsp_signature.on_attach({
          bind = true,
          handler_opts = {
            border = "rounded", -- Rounded borders for the floating window
          },
          hint_enable = true, -- Show virtual text hints
          hint_prefix = " ", -- Icon for hints
          floating_window = true, -- Use floating window
          floating_window_above_cur_line = true, -- Show above the line if possible
        }, bufnr)
      end

      -- Configure your LSP servers with the `on_attach` function
      lspconfig.ts_ls.setup {
        on_attach = on_attach,
      }

      lspconfig.pyright.setup {
        on_attach = on_attach,
      }

      lspconfig.lua_ls.setup {
        on_attach = on_attach,
      }

      lspconfig.html.setup {
        on_attach = on_attach,
      }
    end,
  },
}
