# LUA CONFIGURATION
## OPTIONS
* Program starts at init.lua
* vim.o -> global options
* vim.wo -> local to window
* vim.bo -> local to buffer

## REMAPS
vim.api.nvim_set_keymap({mode}, {keymap}, {mapped to}, {options})
Para ver en que se usa cierto remap :verbose {mode}map {keymap}

## PACKAGES
Packer
* Installation
```bash
git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim
```
* Setup
>> :PackerSync

### Interesting packages
#### LSP
Open with :LspInstallInfo
Show information in current buffer :LspInfo

### SNIPETS
When appears ${n: name} means that has supertab. The tab can be used to jump between arguments
As in autocomplete it useful <c-e> and <c-y>
There is a lot of possible sources of completion (see docs)

### LAZY GIT
You have to install it on the system previously.
Easy to install from source using rust.

### VIM dap
#### For python
1- Install debugpy
2- It is recommended to install debugpy into a dedicated virtualenv. To do so:
```bash
mkdir .virtualenvs
cd .virtualenvs
python -m venv debugpy
debugpy/bin/python -m pip install debugpy 
```
3- Install treesitter extension
```
:TSInstall python
```






