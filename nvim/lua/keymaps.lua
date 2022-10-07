-- Para ver en que se usa cierto remap :verbose {mode}map {keymap}

local opts = {noremap = true, silent = true}

-- Remaps ---------------------------------------------------------------
local keymap = vim.api.nvim_set_keymap

vim.g.mapleader = " "

keymap('i', 'jk', '<ESC>', opts)  -- rempap para ESC

-- Resizing splits
vim.keymap.set('n', '<M-Left>', require('smart-splits').resize_left)
vim.keymap.set('n', '<M-Down>', require('smart-splits').resize_down)
vim.keymap.set('n', '<M-Up>', require('smart-splits').resize_up)
vim.keymap.set('n', '<M-Right>', require('smart-splits').resize_right)
-- Moving between splits
vim.keymap.set('n', '<M-h>', require('smart-splits').move_cursor_left)
vim.keymap.set('n', '<M-j>', require('smart-splits').move_cursor_down)
vim.keymap.set('n', '<M-k>', require('smart-splits').move_cursor_up)
vim.keymap.set('n', '<M-l>', require('smart-splits').move_cursor_right)

-- Copy to system clipboard
keymap('v', '<C-c>', '"+y', opts)  
keymap('n', '<C-c>', 'V"+y', opts)  

-- Move lines
keymap('n', '<C-j>', ':m .+1<CR>==', opts)  
keymap('n', '<C-k>', ':m .-2<CR>==', opts)  
keymap('i', '<C-j>', '<Esc>:m .+1<CR>==gi', opts)  
keymap('i', '<C-k>', '<Esc>:m .-2<CR>==gi', opts)  
keymap('v', '<C-j>', ":m '>+1<CR>gv=gv", opts)  
keymap('v', '<C-k>', ":m '<-2<CR>gv=gv", opts)  

-- Buffers:
keymap('n', '<TAB>', ':bnext<CR>', opts)  
keymap('n', '<S-TAB>', ':bprevious<CR>', opts)  

-- Better indentation
keymap('v', '<', '<gv', opts)  
keymap('v', '>', '>gv', opts)  


-- Move in autocomplete
-- vim.cmd('inoremap pumvisible() ? "\\<c-e>" : "\\<esc>"')
-- vim.cmd('inoremap pumvisible() ? "\\<c-y>" : "\\<CR>"')
-- vim.cmd('inoremap pumvisible() ? "\\<c-n>" : "\\<c-j>"')
-- vim.cmd('inoremap pumvisible() ? "\\<c-p>" : "\\<c-k>"')
-- keymap('i', '<expr> <Esc>', 'pumvisible() ? "\\<c-e>" : "\\<esc>"', {noremap=true, expr = true})
-- keymap('i', '<expr> <CR>', 'pumvisible() ? "\\<C-y>" : "\\<CR>"', {noremap=true, expr = true})
-- keymap('i', '<expr> <C-j>', 'pumvisible() ? "\\<C-n>" : "\\<C-j>"', {noremap=true, expr = true})
-- keymap('i', '<expr> <C-k>', 'pumvisible() ? "\\<C-p>" : "\\<C-k>"', {noremap=true, expr = true})

-- Surround
-- let g:surround_no_mappings = 1
-- nmap ds       <Plug>Dsurround
-- nmap cs       <Plug>Csurround
-- nmap cS       <Plug>CSurround
-- nmap ys       <Plug>Ysurround
-- nmap yS       <Plug>YSurround
-- nmap yss      <Plug>Yssurround
-- nmap ySs      <Plug>YSsurround
-- nmap ySS      <Plug>YSsurround
-- xmap gs       <Plug>VSurround
-- xmap gS       <Plug>VgSurround

