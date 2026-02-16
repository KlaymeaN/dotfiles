--return {
--  {
--    "neovim/nvim-lspconfig",
--    config = function()
--      local lspconfig = require("lspconfig")
--      local capabilities = require("cmp_nvim_lsp").default_capabilities()
--      local lsp_flags = { debounce_text_changes = 80 }
--
--      -- optional: require lsp_signature ONCE if you want it everywhere
--      local lsp_signature = require("lsp_signature")
--
--      local on_attach = function(client, bufnr)
--        -- Attach lsp_signature (comment this out if you want to disable)
--        lsp_signature.on_attach({
--          bind = true,
--          handler_opts = { border = "rounded" },
--          hint_enable = true,
--          hint_prefix = " ",
--          floating_window = true,
--          floating_window_above_cur_line = true,
--        }, bufnr)
--      end
--
--      -- Common opts
--      local opts = {
--        on_attach = on_attach,
--        capabilities = capabilities,
--        flags = lsp_flags,
--      }
--
--      -- Configure servers
--      lspconfig.ts_ls.setup(opts)
--      lspconfig.pyright.setup(opts)
--      lspconfig.lua_ls.setup(opts)
--      lspconfig.html.setup(opts)
--    end,
--  },
--}
--

--
--return {
--  {
--    "neovim/nvim-lspconfig",
--    config = function()
--
--      local capabilities = require("cmp_nvim_lsp").default_capabilities()
--      local lsp_flags = { debounce_text_changes = 80 }
--
--      -- optional: require lsp_signature ONCE if you want it everywhere
--      local lsp_signature = require("lsp_signature")
--
--      local on_attach = function(client, bufnr)
--        lsp_signature.on_attach({
--          bind = true,
--          handler_opts = { border = "rounded" },
--          hint_enable = true,
--          hint_prefix = " ",
--          floating_window = true,
--          floating_window_above_cur_line = true,
--        }, bufnr)
--      end
--
--      local opts = {
--        on_attach = on_attach,
--        capabilities = capabilities,
--        flags = lsp_flags,
--      }
--
--       --Detect API version
--      --local lspconfig
--      --if vim.lsp and vim.lsp.config then
--      --  lspconfig = vim.lsp.config
--      --else
--      ----  -- Neovim ≤ 0.10
--      --  lspconfig = require("lspconfig")
--      --end
--      local lspconfig = require('lspconfig')
--
--      -- Configure servers
--      lspconfig.ts_ls.setup(opts)
--      lspconfig.pyright.setup(opts)
--      lspconfig.lua_ls.setup(opts)
--      lspconfig.html.setup(opts)
--    end,
--  },
--}
--



return {
  {
    "neovim/nvim-lspconfig",
    config = function()
      -- completion capabilities (nvim-cmp)
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      -- optional: lsp_signature once for all servers
      local lsp_signature = require("lsp_signature")
      local on_attach = function(client, bufnr)
        lsp_signature.on_attach({
          bind = true,
          handler_opts = { border = "rounded" },
          hint_enable = true,
          hint_prefix = " ",
          floating_window = true,
          floating_window_above_cur_line = true,
        }, bufnr)
      end

      -- shared opts (flags.debounce_text_changes is generally unnecessary on 0.11+)
      local opts = {
        on_attach = on_attach,
        capabilities = capabilities,
        -- flags = { debounce_text_changes = 80 }, -- optional; often ignored
      }

      -- Define server configs (merged with nvim-lspconfig’s defaults)
      vim.lsp.config("ts_ls",   opts)
      vim.lsp.config("pyright", opts)
      vim.lsp.config("lua_ls",  opts)
      vim.lsp.config("html",    opts)

      -- Enable them (autostarts on matching filetypes/root dirs)
      vim.lsp.enable({ "ts_ls", "pyright", "lua_ls", "html" })
    end,
  },
}



