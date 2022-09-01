vim.o.foldmethod = 'indent'
vim.o.tabstop=4                             -- Insert 4 spaces for a tab
vim.o.softtabstop=4
vim.o.shiftwidth=4                          -- Change the number of space characters inserted for indentation
vim.cmd('set colorcolumn=80,120')           -- Column of different color

 -- "Semshi
-- "function MyCustomHighlights()
    -- "sign define semshiError text=✗ texthl=semshiErrorSign
-- "endfunction
-- "autocmd FileType python call MyCustomHighlights()
-- "let g:semshi#error_sign = 0

-- 
-- " Dap Python -----------------------------------------------------------------
require('dap-python').setup('~/.virtualenvs/debugpy/bin/python')
require('dap-python').test_runner = 'pytest'


--    Virtual text configuration
-- require("nvim-dap-virtual-text").setup {
--     enabled = true,                     -- enable this plugin (the default)
--     enabled_commands = true,            -- create commands DapVirtualTextEnable, DapVirtualTextDisable, DapVirtualTextToggle, (DapVirtualTextForceRefresh for refreshing when debug adapter did not notify its termination)
--     highlight_changed_variables = true, -- highlight changed values with NvimDapVirtualTextChanged, else always NvimDapVirtualText
--     highlight_new_as_changed = false,   -- highlight new variables in the same way as changed variables (if highlight_changed_variables)
--     show_stop_reason = true,            -- show stop reason when stopped for exceptions
--     commented = false,                  -- prefix virtual text with comment string
--     -- experimental features:
--     virt_text_pos = 'eol',              -- position of virtual text, see `:h nvim_buf_set_extmark()`
--     all_frames = false,                 -- show virtual text for all stack frames not only current. Only works for debugpy on my machine.
--     virt_lines = false,                 -- show virtual lines instead of virtual text (will flicker!)
--     virt_text_win_col = nil             -- position the virtual text at a fixed window column (starting from the first text column) ,
--                                         -- e.g. 80 to position at column 80, see `:h nvim_buf_set_extmark()`
-- }

-- " Dap ------------------------------------------------------------------------
-- "  Only DAP
-- nnoremap <leader>dd :w<CR> <bar> :lua require('dap').continue()<CR>
-- nnoremap <leader>dl :w<CR> <bar> :lua require'dap'.run_last()<CR>
-- "nnoremap <leader>dq :lua require'dap'.disconnect()<CR> <bar> :lua require'dap'.close()<CR>
-- nnoremap <leader>db :lua require'dap'.toggle_breakpoint()<CR>
-- nnoremap <leader>dcb :lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>
-- nnoremap <leader>dr :lua require'dap'.repl.toggle()<CR>
-- nnoremap <F3> :lua require'dap'.down()<CR>
-- nnoremap <F4> :lua require'dap'.up()<CR>
-- nnoremap <F6> :lua require'dap'.pause()<CR>
-- nnoremap <F8> :lua require'dap'.step_over()<cr>
-- nnoremap <F7> :lua require'dap'.step_into()<CR>
-- nnoremap <F9> :lua require'dap'.step_out()<CR>
-- 
-- nnoremap <leader>dt :lua require('dapui').toggle()<CR>
-- nnoremap <leader>dq :lua require('dapui').close()<CR> <bar> :lua require'dap'.disconnect()<CR> <bar> :lua require'dap'.close()<CR>
-- nnoremap <leader>ds :lua require'dap.ui.widgets'.hover()<CR>
-- vnoremap <leader>ds :lua require'dap.ui.widgets'.visual_hover()<CR>
-- nnoremap <silent>de :lua require'dapui'.eval()<cr>
-- vnoremap <leader>de <Cmd>lua require("dapui").eval()<CR>
-- nnoremap <silent>dm :lua require'dapui'.float_element("repl")<cr>
-- " Variables/Scopes
-- "nnoremap <leader>dv :lua local widgets=require'dap.ui.widgets';widgets.centered_float(widgets.scopes)<CR>
-- 
-- " Rcarriga mappings
-- "nnoremap <silent> <M-c> :lua require'dap'.continue()<CR>
-- "nnoremap <silent> <M-right> :lua require'dap'.step_over()<CR>
-- "nnoremap <silent> <M-down> :lua require'dap'.step_into()<CR>
-- "nnoremap <silent> <M-up> :lua require'dap'.step_out()<CR>
-- "nnoremap <silent> <M-x> :lua require'dap'.toggle_breakpoint()<CR>
-- "nnoremap <silent> <M-t> :lua require('dapui').toggle()<CR>
-- "vnoremap <silent> <M-c> <ESC>:lua require('dap-python').debug_selection()<CR>
-- "nnoremap <silent> <M-l> :lua require"osv".launch()<CR>
-- "nnoremap <silent> <M-k> :lua require'dapui'.eval()<cr>
-- "vnoremap <M-k> <Cmd>lua require'dapui'.eval()<cr>
-- "nnoremap <silent> <M-m> :lua require'dapui'.float_element()<cr>
-- "nnoremap <silent> <M-v> :lua require'dapui'.float_element("scopes")<cr>
-- "nnoremap <silent> <M-r> :lua require'dapui'.float_element("repl")<cr>
-- "nnoremap <silent> <M-q> :lua require'dap'.disconnect()<cr>
-- 
