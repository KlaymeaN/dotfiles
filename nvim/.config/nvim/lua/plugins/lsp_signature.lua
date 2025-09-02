return {
  -- Other plugins...
  {
    "ray-x/lsp_signature.nvim",
    event = "InsertEnter",
    opts = {
      bind = true,
      handler_opts = {
        border = "rounded",
      },
      hint_enable = false,
      hint_prefix = "", -- Change this icon if needed
      floating_window = true,
      floating_window_above_cur_line = true,
      hi_parameter = "LspSignatureActiveParameter",
    },
    config = function(_, opts)
      require("lsp_signature").setup(opts)
    end,
  },
}

