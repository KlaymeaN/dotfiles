return {
    "iamcco/markdown-preview.nvim",
    build = "cd app && npm install",
    ft = { "markdown" },
    cmd = { "MarkdownPreview", "MarkdownPreviewStop", "MarkdownPreviewToggle" },
    config = function()
      -- Optional: auto-start preview when opening markdown files
       vim.g.mkdp_auto_start = 0
           -- Optional: auto-close preview when buffer is closed
       vim.g.mkdp_auto_close = 1
  --                 -- Optional: refresh preview only on save (instead of every keystroke)
       vim.g.mkdp_refresh_slow = 0
  --                         -- Optional: set default browser (empty = system default)
       vim.g.mkdp_browser = ""
       vim.g.mkdp_browser = "brave"
                                 end,
                                }
