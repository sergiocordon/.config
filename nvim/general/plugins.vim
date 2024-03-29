" To install, add to list and call :PlugInstall
" To uninstall, remove from list and call,exit, enter nvim and :PlugClean
" To update Plug call :PlugUpgrade
" To update the pluggins :PlugUpdate
" Usefull :PlugStatus
" To copy and paste -> sudo apt install xsel

" Specify a directory for plugins
call plug#begin('~/.config/nvim/plugged')
Plug 'nvim-lua/plenary.nvim'  " Needed for most
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " We recommend updating the parsers on update

" Autocomplete pluggins needs
"   sudo apt install nodejs && sudo apt install npm  
Plug 'neoclide/coc.nvim', {'branch': 'release'}
"Plug 'pappasam/coc-jedi', { 'do': 'yarn install --frozen-lockfile && yarn build', 'branch': 'main'}
Plug 'neoclide/coc-tsserver'
Plug 'neoclide/coc-json'
Plug 'fannheyward/coc-pyright'  " Errores en python
Plug 'iamcco/coc-vimlsp'  " Completado de funciones y documentacion flotante

" See registers
Plug 'junegunn/vim-peekaboo'

" Themes
Plug 'morhetz/gruvbox'
Plug 'arcticicestudio/nord-vim'

" Maximize panels
Plug 'szw/vim-maximizer'

"Icons
Plug 'ryanoasis/vim-devicons'

" Git    
Plug 'tpope/vim-fugitive'  " Windows to git control, call git with :G
Plug 'airblade/vim-gitgutter'  " Shows git state on the left column
Plug 'TimUntersberger/neogit'
Plug 'sindrets/diffview.nvim'

" Airline (bar on the bottom)
Plug 'vim-airline/vim-airline' " Bottom bar that shows the state
Plug 'vim-airline/vim-airline-themes'


"FZF
" https://github.com/junegunn/fzf 
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'airblade/vim-rooter'  " look inside projects

" Nerdtree
Plug 'scrooloose/nerdtree'

" Markdown visualizer -> call with :MarkdownPreview -> Leader md
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}

" Lightspeed -> s + letter to go to that letter anywhere
Plug 'ggandor/lightspeed.nvim'

"Startify
Plug 'mhinz/vim-startify'

"Commenter
Plug 'preservim/nerdcommenter'

"Rainbow
Plug 'frazrepo/vim-rainbow'

" Surround
Plug 'tpope/vim-surround'

" CSV
Plug 'chrisbra/csv.vim'

" Colors
Plug 'lilydjwg/colorizer'

" PYTHON -----------------------------------------------------------------
" recommended pip install neovim; pip3 install neovim

" Debug -> you need to open the terminal with env activated
Plug 'mfussenegger/nvim-dap'
Plug 'mfussenegger/nvim-dap-python'
Plug 'theHamsta/nvim-dap-virtual-text'
Plug 'rcarriga/nvim-dap-ui'

" Shemshy -> highligtning | it give too many bugs
" pip3 install pynvim --upgrade 
"Plug 'numirias/semshi', { 'do': ':UpdateRemotePlugins' }
" :UpdateRemotePlugins

" Python sense -> movements
Plug 'jeetsukumaran/vim-pythonsense'

" Snippets
"Plug 'SirVer/ultisnips'
"Plug 'honza/vim-snippets'

" Docstring  
"Plug 'yaegassy/coc-pydocstring', {'do': 'yarn install --frozen-lockfile'}  " Had to change 'sphinx' -> 'google' after installation (package.json)
Plug 'pixelneo/vim-python-docstring'

call plug#end()


" Dap
"mkdir .virtualenvs
"cd .virtualenvs
"python -m venv debugpy
"debugpy/bin/python -m pip install debugpy

" also -> :TSInstall python


" Git fugitive
" :G abre git status, desde esta pantalla podemos hacer stage(s) o unstage(u) 
" si se pulsa encima del STAGED se cambian todos
" Si nos ponemos encima de cualquiera podemos darle a = para ver los cambios 
"
" Para resolver conflictos:
" 1- hacemos checkout a la rama en la que queremos juntar todo (target)
" 2- :G merge feature-branch  (o como llamemos a la otra)
" 3- Nos aparecera que hay conflictos, aceptamos y vamos al menu :G
" 4- en el menu nos posicionamos sobre la rama y pulsamos dv para sacar el
" diff, esto nos mostrará 3 pantallas, en orden [target | final | feature]
" 5- nos posicionamos en la final (central) y vamos por los cambios. 
" para aceptar un cambio de la izq -> <leader>g1, de la dch -> <leader>g2
" 6- para terminar cerramos con ctrl+w o
"
" Para ver la diferencia con el index (last commited version) 
" :Gdiff o dv en la pantalla de :G
" podemos añadir cambios de un lado a otro con :diffget y :diffput 
"
" para restaurar todos los cambios :G write o :G read dependiendo si se llama
" desde el index o de la working-copy
" Si se guarda la copia del index, los cambios estarán en el stage
"
" A veces tras algun cambio no se actualiza bien los colores en git:
" :diffupdate
