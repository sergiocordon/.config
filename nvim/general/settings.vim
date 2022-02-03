" set leader key
let g:mapleader = "\<Space>"

syntax enable                           " Enables syntax highlighting
set background=dark                     " tell vim what the background color looks like
set clipboard=unnamedplus               " Copy paste between vim and everything else
set cmdheight=2                         " More space for displaying messages
set conceallevel=0                      " So that I can see `` in markdown files
set cursorline                          " Enable highlighting of the current line
set encoding=utf-8                      " The encoding displayed
set fileencoding=utf-8                  " The encoding written to file
set formatoptions-=cro                  " Stop newline continuation of comments
set hidden                              " Required to keep multiple buffers open multiple buffers
set iskeyword+=-                      	" treat dash separated words as a word text object"
set laststatus=0                        " Always display the status line
set mouse=a                             " Enable your mouse
set nobackup                            " This is recommended by coc
set nohlsearch                          " Don't keep highlighting after searching
set nowrap                              " Display long lines as just one line
set nowritebackup                       " This is recommended by coc
set pumheight=10                        " Makes popup menu smaller
set ruler          		            	" Show the cursor position all the time
set scrolloff=10                        " Scroll when X away from the top/bottom
set showtabline=2                       " Always show tabs
set signcolumn=yes                      " Extra column at the beginning to show errors, etc.
set smartindent                         " Makes indenting smart
set smarttab                            " Makes tabbing smarter will realize you have 2 vs 4
set splitbelow                          " Horizontal splits will automatically be below
set splitright                          " Vertical splits will automatically be to the right
"set t_Co=256                            " Support 256 colors
set termguicolors
set timeoutlen=500                      " By default timeoutlen is 1000 ms
set updatetime=300                      " Faster completion
set fileformat=unix
set expandtab                           " Converts tabs to spaces
set autoindent                          " Good auto indent
set noswapfile
au! BufWritePost $MYVIMRC source %      " auto source when writing to init.vm alternatively you can run :source $MYVIMRC


" For filetypes
set filetype=on

" Spell -> to change a word z= or with telescope <leader>fs
"set spell!
"set spelllang=en

" Set line numbers 
set number
highlight clear SignColumn
augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave,WinEnter * if &nu && mode() != "i" | set rnu   | endif
  autocmd BufLeave,FocusLost,InsertEnter,WinLeave   * if &nu                  | set nornu | endif
augroup END
set signcolumn=auto
autocmd ColorScheme * highlight! link SignColumn LineNr

" Save only read files
cmap w!! w !sudo tee %

" Faster response
set updatetime=1000

"setting colorcolumn color
highlight ColorColumn ctermbg=7
set colorcolumn=80,120                      " Column of different color

" Enable folding
set foldmethod=indent
set foldlevel=99

" ColorScheme
"colorscheme gruvbox
colorscheme nord
set background=dark

" Startify
let g:startify_custom_header = []


" Rainbow
let g:rainbow_active = 1
let g:rainbow_ctermfgs = ['lightblue', 'lightgreen', 'yellow', 'red', 'magenta']


" Airline --------------------------------------------------------------------
let g:airline#extensions#tabline#enabled = 1  " Show buffers on top
let g:airline#extensions#branch#enabled = 1
let g:airline_detect_spell=0
let g:airline_powerline_fonts = 1

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" symbols
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.whitespace = 'Ξ'
let g:airline_left_alt_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''
let g:airline_symbols.notexists = 'Ɇ'
let g:airline_symbols.dirty='⚡'


" GitGutter ------------------------------------------------------------------
let g:gitgutter_sign_allow_clobber = 1
let g:gitgutter_map_keys = 0
highlight GitGutterAdd    guifg=#009900 ctermfg=2
highlight GitGutterChange guifg=#DC7633 ctermfg=3
highlight GitGutterDelete guifg=#ff2222 ctermfg=1
let g:gitgutter_sign_added = '▎'
let g:gitgutter_sign_modified = '▎'
let g:gitgutter_sign_removed = '▎'
let g:gitgutter_sign_removed_first_line = '▎'
let g:gitgutter_sign_removed_above_and_below = '▎'
let g:gitgutter_sign_modified_removed = '▎'


" Coc -------------------------------------------------------------------------

"   TextEdit might fail if hidden is not set.
set hidden

"   Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

"   Give more space for displaying messages.
set cmdheight=2

"   Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
"   delays and poor user experience.
set updatetime=300

"   Don't pass messages to |ins-completion-menu|.
set shortmess+=c

"   Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')


" Dap Python -----------------------------------------------------------------
lua require('dap-python').setup('~/.virtualenvs/debugpy/bin/python')
lua require('dap-python').test_runner = 'pytest'

lua << EOF
vim.fn.sign_define('DapStopped', {text='⦿', texthl='', linehl='', numhl=''})
vim.fn.sign_define('DapBreakpoint', {text='〇', texthl='', linehl='', numhl=''})
EOF

"    Virtual text configuration
lua require("nvim-dap-virtual-text").setup()
"lua <<EOF
"require("nvim-dap-virtual-text").setup {
    "enabled = true,                     -- enable this plugin (the default)
    "enabled_commands = true,            -- create commands DapVirtualTextEnable, DapVirtualTextDisable, DapVirtualTextToggle, (DapVirtualTextForceRefresh for refreshing when debug adapter did not notify its termination)
    "highlight_changed_variables = true, -- highlight changed values with NvimDapVirtualTextChanged, else always NvimDapVirtualText
    "highlight_new_as_changed = false,   -- highlight new variables in the same way as changed variables (if highlight_changed_variables)
    "show_stop_reason = true,            -- show stop reason when stopped for exceptions
    "commented = false,                  -- prefix virtual text with comment string
    "-- experimental features:
    "virt_text_pos = 'eol',              -- position of virtual text, see `:h nvim_buf_set_extmark()`
    "all_frames = false,                 -- show virtual text for all stack frames not only current. Only works for debugpy on my machine.
    "virt_lines = false,                 -- show virtual lines instead of virtual text (will flicker!)
    "virt_text_win_col = nil             -- position the virtual text at a fixed window column (starting from the first text column) ,
                                        "-- e.g. 80 to position at column 80, see `:h nvim_buf_set_extmark()`
"}
"EOF


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


" NeoGit
"lua << EOF
"local neogit = require('neogit')
"neogit.setup {
  "disable_signs = false,
  "disable_hint = false,
  "disable_context_highlighting = false,
  "disable_commit_confirmation = true,
  "auto_refresh = true,
  "disable_builtin_notifications = false,
  "use_magit_keybindings = false,
  "commit_popup = {
      "kind = "split",
  "},
  "-- Change the default way of opening neogit
  "kind = "tab",
  "-- customize displayed signs
  "signs = {
    "-- { CLOSED, OPENED }
    "section = { ">", "v" },
    "item = { ">", "v" },
    "hunk = { "", "" },
  "},
  "integrations = {
    "diffview = True
  "},
  "-- Setting any section to `false` will make the section not render at all
  "sections = {
    "untracked = {
      "folded = false
    "},
    "unstaged = {
      "folded = false
    "},
    "staged = {
      "folded = false
    "},
    "stashes = {
      "folded = true
    "},
    "unpulled = {
      "folded = true
    "},
    "unmerged = {
      "folded = false
    "},
    "recent = {
      "folded = true
    "},
  "},
  "-- override/add mappings
  "-- mappings = {
    "-- modify status buffer mappings
    "-- status = {
      "-- Adds a mapping with "B" as key that does the "BranchPopup" command
      "-- ["B"] = "BranchPopup",
      "-- Removes the default mapping of "s"
      "-- ["s"] = "",
    "-- }
  "-- }
"}
"EOF


" FZF ------------------------------------------------------------------------
let g:fzf_history_dir = '~/local/share/fzf-history'

let g:fzf_tags_command = 'ctags -R'
" Border color
let g:fzf_layout = {'up':'~90%', 'window': { 'width': 0.8, 'height': 0.8,'yoffset':0.5,'xoffset': 0.5, 'highlight': 'Todo', 'border': 'rounded' } }

let $FZF_DEFAULT_OPTS = '--layout=reverse --info=inline'
let $FZF_DEFAULT_COMMAND="rg --files --hidden"


" Customize fzf colors to match your color scheme
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

"Get Files
command! -bang -nargs=? -complete=dir Files
    \ call fzf#vim#files(<q-args>, fzf#vim#with_preview({'options': ['--layout=reverse', '--info=inline']}), <bang>0)


" Get text in files with Rg
command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always --smart-case '.shellescape(<q-args>), 1,
  \   fzf#vim#with_preview(), <bang>0)

" Ripgrep advanced
function! RipgrepFzf(query, fullscreen)
  let command_fmt = 'rg --column --line-number --no-heading --color=always --smart-case %s || true'
  let initial_command = printf(command_fmt, shellescape(a:query))
  let reload_command = printf(command_fmt, '{q}')
  let spec = {'options': ['--phony', '--query', a:query, '--bind', 'change:reload:'.reload_command]}
  call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(spec), a:fullscreen)
endfunction

command! -nargs=* -bang RG call RipgrepFzf(<q-args>, <bang>0)

" Git grep
command! -bang -nargs=* GGrep
  \ call fzf#vim#grep(
  \   'git grep --line-number '.shellescape(<q-args>), 0,
  \   fzf#vim#with_preview({'dir': systemlist('git rev-parse --show-toplevel')[0]}), <bang>0)
