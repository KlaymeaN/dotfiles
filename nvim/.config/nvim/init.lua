vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")

--Leader key:

vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

--for copying:
--vim.api.nvim_set_option("clipboard", "unnamed")
--vim.api.nvim_set_option("clipboard", "unnamed")
--vim.opt.clipboard = "unnamedplus"
-- Ensure Neovim uses the system clipboard
vim.opt.clipboard = "unnamedplus"

-- Copy (yank) to system clipboard with Ctrl+C
vim.keymap.set({ "n", "v" }, "<C-c>", '"+y', { desc = "Yank to clipboard" })

-- Paste from system clipboard with Ctrl+V
--vim.keymap.set({ "n", "v" }, "<C-v>", '"+p', { desc = "Paste from clipboard" })
vim.keymap.set("i", "<C-v>", '<C-r>+', { desc = "Paste from clipboard" })
vim.keymap.set("c", "<C-v>", '<C-r>+', { desc = "Paste from clipboard in cmdline" })



-- Yank to system clipboard with Alt+c
vim.keymap.set({ "n", "v" }, "<A-c>", '"+y', { desc = "Yank to clipboard" })

-- Paste from system clipboard with Alt+v
vim.keymap.set({ "n", "v" }, "<A-v>", '"+p', { desc = "Paste from clipboard" })


require("config.lazy")

-- For telescope:
--local builtin = require("telescope.builtin")
--vim.keymap.set('n', '<C-p>', builtin.find_files, {})
--vim.keymap.set('n', '<leader>fg', builtin.live_grep, {} )
vim.keymap.set('n', '<C-p>', function() require("telescope.builtin").find_files() end)
vim.keymap.set('n', '<leader>fg', function() require("telescope.builtin").live_grep() end)


--Line Numbers
vim.wo.relativenumber = true
vim.wo.number = true
vim.cmd [[highlight CursorLineNr guifg=#ffff00 gui=bold]]


--Bufferline  ( tabs)
vim.keymap.set("n", "<Tab>", ":bnext<CR>")
vim.keymap.set("n", "<S-Tab>", ":bprevious<CR>")
vim.keymap.set("n", "<Leader>x", ":bd<CR>")


--Diagnostics
vim.diagnostic.config({
  update_in_insert = true,          -- fixes the “E doesn’t go away until I leave insert”
  severity_sort = true,
  virtual_text = { spacing = 2, prefix = "●" },
  float = { border = "rounded", source = "if_many" },
  signs = true,
  underline = true,
})

--TOggle diagnostic
vim.keymap.set("n", "<leader>e", function()
  local current = vim.diagnostic.config().virtual_text
  vim.diagnostic.config({ virtual_text = not current })
end, { desc = "Toggle diagnostics virtual text" })

