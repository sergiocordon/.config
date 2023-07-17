local status_ok, npairs = pcall(require, "nvim-ts-autotag")
if not status_ok then
  return
end

-- require('nvim-ts-autotag').setup()
require'nvim-treesitter.configs'.setup {
  autotag = {
    enable = true,
  }
}



