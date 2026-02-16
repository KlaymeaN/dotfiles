return {

  "lervag/vimtex",
  lazy = false,     -- we don't want to lazy load VimTeX
  tag = "v2.15", -- uncomment to pin to a specific release
  init = function()
     --VimTeX configuration goes here, e.g.
    vim.g.vimtex_view_method = "zathura"
    vim.g.vimtex_compiler_method = 'latexmk'
    --NEW
    vim.g.vimtex_compiler_latexmk_engines = { _ = '-xelatex' }

    --experiment
    vim.g.vimtex_compiler_latexmk_engines = { ["_"] = "-xelatex" }



  end,
}










--return {
--  "lervag/vimtex",
--  lazy = false,
--
--  init = function()
--    vim.g.vimtex_view_method = "zathura"
--
--    -- Compiler = xelatex (no latexmk)
--    vim.g.vimtex_compiler_method = "xelatex"
--
--    vim.g.vimtex_compiler_xelatex = {
--      options = {
--        "-synctex=1",
--        "-interaction=nonstopmode",
--        "-file-line-error",
--      },
--    }
--  end,
--}
--



