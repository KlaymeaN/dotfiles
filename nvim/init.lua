vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")

--Leader key:

vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

--for copying:
vim.api.nvim_set_option("clipboard", "unnamed")

require("config.lazy")

-- For telescope:
local builtin = require("telescope.builtin")
vim.keymap.set('n', '<C-p>', builtin.find_files, {})

vim.keymap.set('n', '<leader>fg', builtin.live_grep, {} )

--Line Numbers
vim.wo.relativenumber = true
vim.wo.number = true
vim.cmd [[highlight CursorLineNr guifg=#ffff00 gui=bold]]
