# LUA CONFIGURATION
## OPTIONS
* Program starts at init.lua
* vim.o -> global options
* vim.wo -> local to window
* vim.bo -> local to buffer

## REMAPS
vim.api.nvim_set_keymap({mode}, {keymap}, {mapped to}, {options})

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
* Aerial -> (No instalado) barra lateral para moverse mas rapido por el doc, ver funciones, clases, etc
* vim-bufferline -> (No instalado) muestra los buffers abiertos y si estan guardados
* neotree -> revisar mas en detalle










