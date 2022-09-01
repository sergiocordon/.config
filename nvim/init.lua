-- Colors -------------------------------------------------------------
vim.cmd[[colorscheme nord]]
vim.api.nvim_command('set nohlsearch')
vim.api.nvim_command('set fillchars+=vert:│')  -- Set icon to separate windows
vim.cmd[[hi vertsplit guifg=fg guibg=bg]]  -- Set colors for window separation

-- Plugins --------------------------------------------------------------
require('plugins')

-- Final options and keymaps ---------------------------------------------
require('options')
require('keymaps')

