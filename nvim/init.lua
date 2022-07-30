
require('plugins')
require('options')
require('keymaps')


-- Comands --------------------------------------------------------------
vim.api.nvim_command('set nohlsearch')
vim.api.nvim_command('highlight WinSeparator guibg=None')


-- Colors -------------------------------------------------------------
vim.cmd[[colorscheme nord]]

-- Plugins
require('plugins/cmd')
require('plugins/telescope')
require('plugins/treesitter')
require('plugins/autopairs')
require('plugins/comment')
require('plugins/gitsigns')
require('plugins/nvim-tree')
require('plugins/bufferline')
require('plugins/lualine')
require('plugins/impatient')
require('plugins/indentline')
require('plugins/alpha')
require('plugins/whichkey')

