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
set t_Co=256                            " Support 256 colors
set timeoutlen=500                      " By default timeoutlen is 1000 ms
set updatetime=300                      " Faster completion
set fileformat=unix
set expandtab                           " Converts tabs to spaces
set autoindent                          " Good auto indent
set noswapfile
au! BufWritePost $MYVIMRC source %      " auto source when writing to init.vm alternatively you can run :source $MYVIMRC

" For filetypes
set filetype=on

" Show whitespaces
"set list
set listchars=eol:$,tab:>-,trail:·

" Spell -> to change a word z= or with telescope <leader>fs
set spelllang=en
set spell!

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


" Enable folding
set foldmethod=indent
set foldlevel=99


" Gruvbox
colorscheme gruvbox
set background=dark


" Airline
let g:airline#extensions#tabline#enabled = 1  " Show buffers on top
let g:airline#extensions#branch#enabled = 1
let g:airline_detect_spell=0
let g:airline_powerline_fonts = 1

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" airline symbols
" unicode symbols
"let g:airline_left_sep = '»'
"let g:airline_left_sep = '▶'
"let g:airline_right_sep = '«'
"let g:airline_right_sep = '◀'
let g:airline_symbols.linenr = '☰'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.whitespace = 'Ξ'

"let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
"let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
"let g:airline_symbols.linenr = ''
let g:airline_symbols.notexists = 'Ɇ'
let g:airline_symbols.dirty='⚡'

" GitGutter
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


" Coc

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


" Rainbow
let g:rainbow_active = 1
let g:rainbow_ctermfgs = ['lightblue', 'lightgreen', 'yellow', 'red', 'magenta']



" Telescope
"lua << EOF
"require('telescope').setup{
  "defaults = {
    "-- Default configuration for telescope goes here:
    "-- config_key = value,
    "mappings = {
      "i = {
        "-- map actions.which_key to <C-h> (default: <C-/>)
        "-- actions.which_key shows the mappings for your picker,
        "-- e.g. git_{create, delete, ...}_branch for the git_branches picker
        "-- ["<C-h>"] = "which_key"
      "}
    "}
  "},
  "pickers = {
    "-- Default configuration for builtin pickers goes here:
    "-- picker_name = {
    "--   picker_config_key = value,
    "--   ...
    "-- }
    "-- Now the picker_config_key will be applied every time you call this
    "-- builtin picker
  "},
  "extensions = {
    "-- Your extension configuration goes here:
    "-- extension_name = {
    "--   extension_config_key = value,
    "-- }
    "-- please take a look at the readme of the extension you want to configure
  "}
"}
"EOF

