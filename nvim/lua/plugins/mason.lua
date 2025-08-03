return {
  {
    "williamboman/mason.nvim",
    dependencies = { "williamboman/mason-lspconfig.nvim" },
    config = function()
      require("mason").setup()
      require("mason-lspconfig").setup({
        ensure_installed = {"pyright", "lua_ls", "ts_ls" }, -- Add your LSP servers here
      })
    end,
  },
}

