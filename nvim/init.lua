
require('plugins')


-- Colors -------------------------------------------------------------
vim.cmd[[colorscheme nord]]
vim.api.nvim_command('set nohlsearch')
vim.api.nvim_command('set fillchars+=vert:│')  -- Set icon to separate windows
vim.cmd[[hi vertsplit guifg=fg guibg=bg]]  -- Set colors for window separation


-- Plugins --------------------------------------------------------------
require('plugins/cmp')
require('plugins/telescope')
require('telescope').load_extension "file_browser"
require('plugins/treesitter')
require('plugins/autopairs')
require('plugins/comment')
require('plugins/gitsigns')
-- require('plugins/neo-tree')
require('plugins/bufferline')
require('plugins/lualine')
require('plugins/impatient')
require('plugins/indentline')
require('plugins/alpha')
require('plugins/whichkey')
require('plugins/project')
require('plugins/lsp')
require('plugins/notify')
require('plugins/colorizer')
require('plugins/dap_python')
require('plugins/dap_ui')

require'lspconfig'.pyright.setup{}


-- Final options and keymaps ---------------------------------------------
require('options')
require('keymaps')

vim.api.nvim_set_keymap(
  "n",
  "<space>fb",
  ":Telescope file_browser",
  { noremap = true }
)
