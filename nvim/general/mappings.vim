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
"inoremap "<TAB> ""<left>
"inoremap <<TAB> <><left>
"inoremap '<TAB> ''<left>
"inoremap (<TAB> ()<left>
"inoremap [<TAB> []<left>
"inoremap {<TAB> {}<left>
"inoremap {<CR> {<CR>}<ESC>O
"inoremap {;<CR> {<CR>};<ESC>O


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


" Surround
let g:surround_no_mappings = 1
nmap ds       <Plug>Dsurround
nmap cs       <Plug>Csurround
nmap cS       <Plug>CSurround
nmap ys       <Plug>Ysurround
nmap yS       <Plug>YSurround
nmap yss      <Plug>Yssurround
nmap ySs      <Plug>YSsurround
nmap ySS      <Plug>YSsurround
xmap gs       <Plug>VSurround
xmap gS       <Plug>VgSurround

" buffer close
nmap <S-Q> :bd<CR>
" Move to text buffer
nnoremap <TAB> :bnext<CR>
" Previous buffer
nnoremap <S-TAB> :bprevious<CR>


" Better tabbing
vnoremap < <gv
vnoremap > >gv


" Add new line
nnoremap <Leader>o o<Esc>
nnoremap <Leader>O O<Esc>


" Maximizer
nnoremap <Leader>m :MaximizerToggle!<CR>


" Pydocstring
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
" Git neogit
nnoremap <leader>gg :Neogit<CR>
nnoremap <leader>gd :DiffviewOpen<CR>
nnoremap <leader>gD :DiffviewOpen master<CR>
nnoremap <leader>gl :Neogit log<CR>
nnoremap <leader>gp :Neogit push<CR>


" Terminal
nnoremap <leader>lc :split term://zsh<CR>


" Nerdcommenter
nmap <C-q> <Plug>NERDCommenterToggle
vmap <C-q> <Plug>NERDCommenterToggle<CR>gv


" Salir de la consola
 if has("nvim")
  au TermOpen * tnoremap <Esc> <c-\><c-n>
  au FileType fzf tunmap <Esc>
endif   


" NerdTree
nnoremap <leader>nn :NERDTreeToggle<CR>


" FZF ------------------------------------------------------------------------
" An action can be a reference to a function that processes selected lines
function! s:build_quickfix_list(lines)
  call setqflist(map(copy(a:lines), '{ "filename": v:val }'))
  copen
  cc
endfunction

let g:fzf_action = {
    \ 'ctrl-q': function('s:build_quickfix_list'),
    \ 'ctrl-t': 'tab split',
    \ 'ctrl-s': 'split',
    \ 'ctrl-v': 'vsplit'}
nnoremap gi :Rg <c-r>=expand("<cword>")<cr> <CR>
map <C-f> :Files<CR>
nnoremap <leader>ff :Files<CR>
nnoremap <leader>fg :Rg<CR>
nnoremap <leader>ft :Tags<CR>
nnoremap <leader>fm :Marks<CR>
nnoremap <leader>fb :Buffers<CR>
nnoremap <leader>fl :Lines<CR>


" Coc ------------------------------------------------------------------------
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
