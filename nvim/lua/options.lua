-----------------------------------------------------------
-- Neovim API aliases
-----------------------------------------------------------
--local map = vim.api.nvim_set_keymap -- set global keymap
local cmd = vim.cmd                   -- execute Vim commands
local exec = vim.api.nvim_exec        -- execute Vimscript
local fn = vim.fn                     -- call Vim functions
local g = vim.g                       -- global variables
local opt = vim.opt                   -- global/buffer/windows-scoped options

-- Options ----------------------------------------------------------------------------------
--    ? -> i dont know what does
vim.o.expandtab = true                  -- Coonverts tabs for spaces
vim.o.shiftwidth = 2                    -- Number of space inserted for indentation
vim.o.tabstop = 2                       -- Number of space in a tab
vim.o.autoindent = true                 -- Good autoindent
-- vim.o.foldmethod = 'indent'
vim.o.foldmethod = 'syntax'
vim.o.foldlevelstart = 99
vim.cmd('filetype plugin indent on')

--  from astrovim
vim.o.completeopt = "menuone,noselect"  -- Options for insert mode completion
vim.o.fillchars = "eob: "               -- Disable `~` on nonexistent lines
vim.o.copyindent = true                 -- Copy the previous indentation on autoindenting
vim.o.cursorline = false                -- Highlight the text line of the cursor
vim.o.fileencoding = "utf-8"            -- File content encoding for the buffer
vim.o.history = 100                     -- Number of commands to remember in a history table
vim.o.ignorecase = true                 -- Case insensitive searching
vim.o.laststatus = 3                    -- globalstatus
vim.o.lazyredraw = true                 -- lazily redraw screen
vim.o.mouse = "a"                       -- Enable mouse support
vim.o.number = true                     -- Show numberline
vim.o.preserveindent = true             -- Preserve indent structure as much as possible
vim.o.pumheight = 10                    -- Height of the pop up menu
vim.o.relativenumber = true             -- Show relative numberline
vim.o.scrolloff = 8                     -- Number of lines to keep above and below the cursor
--vim.o.showmode = false                    -- Disable showing modes in command line
vim.o.showtabline = 2                   -- Show tabs
vim.o.sidescrolloff = 8                 -- Number of columns to keep at the sides of the cursor
vim.o.signcolumn = "yes"                -- Always show the sign column
vim.o.smartcase = true                  -- Case sensitivie searching  
vim.o.splitbelow = true                 -- Splitting a new window below the current one
vim.o.splitright = true                 -- Splitting a new window at the right of the current one
vim.o.swapfile = false                  -- Disable use of swapfile for the buffer
vim.o.termguicolors = true              -- Enable 24-bit RGB color in the TUI
vim.o.timeoutlen = 500                  -- Length of time to wait for a mapped sequence
vim.o.undofile = true                   -- Enable persistent undo
vim.o.updatetime = 500                  -- Length of time to wait before triggering the plugin
vim.o.wrap = false                      -- Disable wrapping of lines longer than the width of window
vim.o.writebackup = false               -- Disable making a backup before overwriting a file
vim.o.ch = 0                            -- Space for the command line at the bottom

-- don't auto commenting new lines
cmd [[au BufEnter * set fo-=c fo-=r fo-=o]]