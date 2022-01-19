set tabstop=4                           " Insert 4 spaces for a tab
set softtabstop=4
set shiftwidth=4                        " Change the number of space characters inserted for indentation
set colorcolumn=80,120                      " Column of different color


" Semshi
function MyCustomHighlights()
    sign define semshiError text=✗ texthl=semshiErrorSign
endfunction
autocmd FileType python call MyCustomHighlights()
let g:semshi#error_sign = 0





" Dap Python
lua require('dap-python').setup('~/.virtualenvs/debugpy/bin/python')
lua require('dap-python').test_runner = 'pytest'

lua << EOF
vim.fn.sign_define('DapStopped', {text='◉', texthl='', linehl='', numhl=''})
vim.fn.sign_define('DapBreakpoint', {text='▷', texthl='', linehl='', numhl=''})
EOF
"    Virtual text configuration
lua <<EOF
require("nvim-dap-virtual-text").setup {
    enabled = true,                     -- enable this plugin (the default)
    enabled_commands = true,            -- create commands DapVirtualTextEnable, DapVirtualTextDisable, DapVirtualTextToggle, (DapVirtualTextForceRefresh for refreshing when debug adapter did not notify its termination)
    highlight_changed_variables = true, -- highlight changed values with NvimDapVirtualTextChanged, else always NvimDapVirtualText
    highlight_new_as_changed = false,   -- highlight new variables in the same way as changed variables (if highlight_changed_variables)
    show_stop_reason = true,            -- show stop reason when stopped for exceptions
    commented = false,                  -- prefix virtual text with comment string
    -- experimental features:
    virt_text_pos = 'eol',              -- position of virtual text, see `:h nvim_buf_set_extmark()`
    all_frames = false,                 -- show virtual text for all stack frames not only current. Only works for debugpy on my machine.
    virt_lines = false,                 -- show virtual lines instead of virtual text (will flicker!)
    virt_text_win_col = nil             -- position the virtual text at a fixed window column (starting from the first text column) ,
                                        -- e.g. 80 to position at column 80, see `:h nvim_buf_set_extmark()`
}
EOF
"    DapUi configuration
"lua <<EOF require("dapui").setup({
  "icons = { expanded = "▾", collapsed = "▸" },
  "mappings = {
    "-- Use a table to apply multiple mappings
    "expand = { "<CR>", "<2-LeftMouse>" },
    "open = "o",
    "remove = "d",
    "edit = "e",
    "repl = "r",
  "},
  "sidebar = {
    "-- You can change the order of elements in the sidebar
    "elements = {
      "-- Provide as ID strings or tables with "id" and "size" keys
      "{ id = "scopes", size = 0.25},
      "{ id = "breakpoints", size = 0.25 },
      "{ id = "stacks", size = 0.25 },
      "{ id = "watches", size = 00.25 },
    "},
    "size = 40,
    "position = "left", -- Can be "left", "right", "top", "bottom"
  "},
  "tray = {
    "elements = { "repl" },
    "size = 0,
    "position = "right", -- Can be "left", "right", "top", "bottom"
  "},
  "floating = {
    "max_height = nil, -- These can be integers or a float between 0 and 1.
    "max_width = nil, -- Floats will be treated as percentage of your screen.
    "border = "single", -- Border style. Can be "single", "double" or "rounded"
    "mappings = {
      "close = { "q", "<Esc>" },
    "},
  "},
  "windows = { indent = 1 },
"})
"EOF
