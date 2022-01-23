" noremap -> no recursive remap
" inoremap -> being in insert mode
" nnoremap -> being in normal mode
" :map to see what is mapped   :verbose map
" source this file :so %


" leaderkey
let g:mapleader = "\<Space>"


" Find highlight group under cursor for changing colorschemes
"nnoremap <F10> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<' . synIDattr(synID(line("."),col("."),0),"name") . "> lo<" . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>

" Autoclose brackets
inoremap " ""<left>
inoremap ' ''<left>
inoremap ( ()<left>
inoremap [ []<left>
inoremap { {}<left>
inoremap {<CR> {<CR>}<ESC>O
inoremap {;<CR> {<CR>};<ESC>O


" Use alt + arrows to resize windows
nnoremap <M-Down>    :resize -2<CR>
nnoremap <M-Up>    :resize +2<CR>
nnoremap <M-Left>    :vertical resize -2<CR>
nnoremap <M-Right>    :vertical resize +2<CR>


" Better window navigation
nnoremap <M-h> <C-W><C-H>
nnoremap <M-j> <C-W><C-J>
nnoremap <M-k> <C-W><C-K>
nnoremap <M-l> <C-W><C-L>


" Move line
nnoremap <C-j> :m .+1<CR>==
nnoremap <C-k> :m .-2<CR>==
inoremap <C-j> <Esc>:m .+1<CR>==gi
inoremap <C-k> <Esc>:m .-2<CR>==gi
vnoremap <C-j> :m '>+1<CR>gv=gv
vnoremap <C-k> :m '<-2<CR>gv=gv


" Easy CAPS ctrl + u for capitalize WORDS
inoremap <C-u> <ESC>vaw~a
nnoremap <C-u> vaw~a<Esc>


" buffer close
nmap <S-Q> :bd<CR>
" Move to text buffer
nnoremap <TAB> :bnext<CR>
" Previous buffer
nnoremap <S-TAB> :bprevious<CR>


" <TAB>: completion.
inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"


" Better tabbing
vnoremap < <gv
vnoremap > >gv


" Add new line
nnoremap <Leader>o o<Esc>
nnoremap <Leader>O O<Esc>


" Maximizer
nnoremap <Leader>m :MaximizerToggle!<CR>


" Coc
"    GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
"nmap <silent> gi <Plug>(coc-implementation)
"nmap <silent> gy <Plug>(coc-type-definition)
"nmap <silent> gr <Plug>(coc-references)

"    Use <C-space> to trigger completion.
inoremap <silent><expr> <C-space> coc#refresh()

"    Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

"    Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

"    Move with tab 
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction


"    Pydocstring
nmap <silent> ga :Docstring


" Markdown
nmap <Leader>md :MarkdownPreview<CR>


" GitGutter
nmap <leader>gp <Plug>(GitGutterPreviewHunk)
nmap ]h <Plug>(GitGutterNextHunk)
nmap [h <Plug>(GitGutterPrevHunk)


" Git - vim fugitive 
nnoremap <leader>g1 :diffget //2<CR>  " Coger de la izq en merge
nnoremap <leader>g2 :diffget //3<CR>  " Coger de la dch en merge
nnoremap <leader>g0 :diffget<CR>  " Coger del otro lado en diff


" Telescope
nnoremap <leader>ff <cmd>Telescope find_files<CR>
nnoremap <leader>ft <cmd>Telescope git_files<CR>
nnoremap <leader>fg <cmd>Telescope live_grep<CR>
nnoremap <leader>fp <cmd>lua require('telescope.builtin').live_grep{ cwd = vim.fn.systemlist("git rev-parse --show-toplevel")[1] }<cr>
nnoremap <leader>fb <cmd>Telescope file_browser<CR>
nnoremap <leader>fs :lua require'telescope.builtin'.spell_suggest{}<CR>
nnoremap <leader>fv :lua require'telescope.builtin'.registers{}<CR>
nnoremap <leader>fv :lua require'telescope.builtin'.marks{}<CR>

nnoremap <leader>gb :lua require'telescope.builtin'.git_branches{}<CR>
nnoremap <leader>gs :lua require'telescope.builtin'.git_stash{}<CR>

 
" Neoterm
nnoremap <leader>lc :split term://zsh<CR>


" Nerdcommenter
nmap <C-q> <Plug>NERDCommenterToggle
vmap <C-q> <Plug>NERDCommenterToggle<CR>gv


" Dap
nnoremap <leader>db :lua require'dap'.toggle_breakpoint()<CR>
nnoremap <leader>dcb :lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>
nnoremap <leader>dd :w<CR> <bar> :lua require('dap').continue()<CR>
nnoremap <leader>dl :w<CR> <bar> :lua require'dap'.run_last()<CR>
nnoremap <F12> :lua require'dap'.close()<CR>
nnoremap <leader>dc :lua require'dap'.close()<CR>
nnoremap <leader>dt :lua require('dap-python').test_method()<CR>
nnoremap <leader>df :lua require('dap-python').test_class()<CR>
nnoremap <leader>dr :lua require'dap'.repl.toggle()<CR>
nnoremap <F4> :lua require'dap'.up()<CR>
nnoremap <F3> :lua require'dap'.down()<CR>
nnoremap <F8> :lua require'dap'.step_over()<cr>
nnoremap <F7> :lua require'dap'.step_into()<CR>
nnoremap <F9> :lua require'dap'.step_out()<CR>
"vnoremap <leader>ds <ESC>:lua require('dap-python').debug_selection()<CR>
"nnoremap <silent> <leader>ds :lua local w = require('dap-python').widgets; w.centered_float(w.scopes)<CR>

"nnoremap <leader>df :lua require('dapui').close()<CR>
"nnoremap <leader>df :lua require('dapui').toggle()<CR>
"nnoremap <leader>di :lua require'dap.ui.widgets'.hover()<CR>
"vnoremap <leader>di :lua require'dap.ui.widgets'.visual_hover()<CR>
"vnoremap <leader>dz <Cmd>lua require("dapui").eval()<CR>
" Variables/Scopes
"nnoremap <leader>dv :lua local widgets=require'dap.ui.widgets';widgets.centered_float(widgets.scopes)<CR>
"nnoremap <silent> <leader>di :lua require'dap.ui.variables'.hover(function () return vim .fn.expand("<cexpr>") end)<CR>
"vnoremap <silent> <leader>di :lua require'dap.ui.variables'.visual_hover()<CR>

" Rcarriga mappings
"nnoremap <silent> <M-c> :lua require'dap'.continue()<CR>
"nnoremap <silent> <M-right> :lua require'dap'.step_over()<CR>
"nnoremap <silent> <M-down> :lua require'dap'.step_into()<CR>
"nnoremap <silent> <M-up> :lua require'dap'.step_out()<CR>
"nnoremap <silent> <M-x> :lua require'dap'.toggle_breakpoint()<CR>
"nnoremap <silent> <M-t> :lua require('dapui').toggle()<CR>
"vnoremap <silent> <M-c> <ESC>:lua require('dap-python').debug_selection()<CR>
"nnoremap <silent> <M-l> :lua require"osv".launch()<CR>
"nnoremap <silent> <M-k> :lua require'dapui'.eval()<cr>
"vnoremap <M-k> <Cmd>lua require'dapui'.eval()<cr>
"nnoremap <silent> <M-m> :lua require'dapui'.float_element()<cr>
"nnoremap <silent> <M-v> :lua require'dapui'.float_element("scopes")<cr>
"nnoremap <silent> <M-r> :lua require'dapui'.float_element("repl")<cr>
"nnoremap <silent> <M-q> :lua require'dap'.disconnect()<cr>

" Salir de la consola
tnoremap <Esc> <C-\><C-n>
    

" NerdTree
nnoremap <leader>nn :NERDTreeToggle<CR>


