local fn = vim.fn

-- Automatically install packer
-- Setup ----------------------------------------------------------------
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
	print("Installing packer close and reopen Neovim...")
	vim.cmd([[packadd packer.nvim]])
end

--     Autocomand to reolad nvim whenever lua is saved
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
    vim.notify("Error loading packer")
	return
end

-- Have packer use a popup window
packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
	},
})

-- Packages -------------------------------------------------------------
require('packer').startup(function(use)
-- Basic plugins
  use({"wbthomason/packer.nvim", commit = "00ec5adef58c5ff9a07f11f45903b9dbbaa1b422"})
  use({"nvim-lua/plenary.nvim", commit = "968a4b9afec0c633bc369662e78f8c5db0eba249"})
  use({"MunifTanjim/nui.nvim", commit = "51cbd0ccc9410e317a947eea1e99966226a5f8b5"})
  use({"kyazdani42/nvim-web-devicons", commit = "2d02a56189e2bde11edd4712fea16f08a6656944"})
 use({"nvim-treesitter/nvim-treesitter", commit = "518e27589c0463af15463c9d675c65e464efc2fe"})
  --use({"lewis6991/impatient.nvim", commit = "969f2c5c90457612c09cf2a13fee1adaa986d350"})
 
 -- Theme
 use({'shaunsingh/nord.nvim', commit = "baf9ab55a8b8a75325ed8a9673e60e4d8fef6092"})

-- GUI
  use({'mrjones2014/smart-splits.nvim', commit = "2af8bc37db4d94027a52f0fdd5674e45e0878df9"})
  use({'romgrk/barbar.nvim', requires = {'kyazdani42/nvim-web-devicons'}, commit= "61424a6211431a42458bc755b3e7e982e671c438"})
  use({"nvim-lualine/lualine.nvim", commit = "3362b28f917acc37538b1047f187ff1b5645ecdd"})
  use({"goolord/alpha-nvim", commit = "ef27a59e5b4d7b1c2fe1950da3fe5b1c5f3b4c94"})
  use({"nvim-telescope/telescope-file-browser.nvim", commit = "4272c52078cc457dfaabce6fa3545e7495651d04"})
  use({"nvim-telescope/telescope.nvim", commit = "d96eaa914aab6cfc4adccb34af421bdd496468b0"})
 
-- Debug 
  use({"mfussenegger/nvim-dap", commit = '66d33b7585b42b7eac20559f1551524287ded353'})
  use({"mfussenegger/nvim-dap-python", commit = '86d263609c7253a6043b07e695f565ed8e34fcbf'})
  use({"rcarriga/nvim-dap-ui", commit = '225115ae986b39fdaffaf715e571dd43b3ac9670'})
 
-- Code
  use({"ahmedkhalf/project.nvim", commit = "541115e762764bc44d7d3bf501b6e367842d3d4f"})
  use({"tpope/vim-commentary", commit = "3654775824337f466109f00eaf6759760f65be34"})
  use({"windwp/nvim-autopairs", commit = "fa6876f832ea1b71801c4e481d8feca9a36215ec"})
  use({"windwp/nvim-ts-autotag", commit = "fdefe46c6807441460f11f11a167a2baf8e4534b"})
  use({"tpope/vim-surround", commit = "bf3480dc9ae7bea34c78fbba4c65b4548b5b1fea"})
  use({"folke/which-key.nvim", commit = "bd4411a2ed4dd8bb69c125e339d837028a6eea71"})
  use({'justinmk/vim-sneak', commit = "94c2de47ab301d476a2baec9ffda07367046bec9"})
  use({'frazrepo/vim-rainbow', commit = "a6c7fd5a2b0193b5dbd03f62ad820b521dea3290"})
  --use({"lukas-reineke/indent-blankline.nvim", commit = "6177a59552e35dfb69e1493fd68194e673dc3ee2"})
  --use({'norcalli/nvim-colorizer.lua', commit = "36c610a9717cc9ec426a07c8e6bf3b3abcb139d6"})
  --use({'Darazaki/indent-o-matic', commit = "bf37c6e4ccd17197d32dee69cffab4f5bbe4cbf2"})
  --use({"kdheepak/lazygit.nvim", commit = "9c73fd69a4c1cb3b3fc35b741ac968e331642600"})

-- Git
  use({"lewis6991/gitsigns.nvim", commit = "c18e016864c92ecf9775abea1baaa161c28082c3"})
  -- use({"sindrets/diffview.nvim", requires = 'nvim-lua/plenary.nvim', commit = "a45163cb9ee65742cf26b940c2b24cc652f295c9"})

-- LSP
  -- https://github.com/glepnir/lspsaga.nvim
  use({"neovim/nvim-lspconfig", commit = "148c99bd09b44cf3605151a06869f6b4d4c24455"}) -- enable LSP
  use({"williamboman/nvim-lsp-installer", commit = "e9f13d7acaa60aff91c58b923002228668c8c9e6"}) -- simple to use language server installer
  use({"jose-elias-alvarez/null-ls.nvim", commit = "ff40739e5be6581899b43385997e39eecdbf9465"}) -- for formatters and linters
  
  -- cmp plugins REVISAR
  use({"hrsh7th/nvim-cmp", commit = "706371f1300e7c0acb98b346f80dad2dd9b5f679"}) -- The completion plugin
  use({"hrsh7th/cmp-buffer", commit = "62fc67a2b0205136bc3e312664624ba2ab4a9323"}) -- buffer completions
  use({"hrsh7th/cmp-path", commit = "466b6b8270f7ba89abd59f402c73f63c7331ff6e"}) -- path completions
  use({"saadparwaiz1/cmp_luasnip", commit = "a9de941bcbda508d0a45d28ae366bb3f08db2e36"}) -- snippet completions
  use({"hrsh7th/cmp-nvim-lua", commit = "d276254e7198ab7d00f117e88e223b4bd8c02d21"})
  use({"hrsh7th/cmp-nvim-lsp", commit = "affe808a5c56b71630f17aa7c38e15c59fd648a8"})
  use({"L3MON4D3/LuaSnip", commit = "79b2019c68a2ff5ae4d732d50746c901dd45603a" }) --snippet engine REQUIRED
  use({"rafamadriz/friendly-snippets", commit = "d27a83a363e61009278b6598703a763ce9c8e617"}) -- a bunch of snippets to use
  
  
  
-- Automatically set up your configuration after cloning packer.nvim
-- Put this at the end after all plugins
if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)

-- Plugin initialization

require('plugins/telescope')
require('plugins/treesitter')
require('plugins/autopairs')
require('plugins/autotag')
require('plugins/gitsigns')
require('plugins/lualine')
require('plugins/impatient')
require('plugins/indentline')
require('plugins/alpha')
require('plugins/whichkey')
require('plugins/project')
require('plugins/lsp')
require('plugins/cmp')
require('plugins/colorizer')
require('plugins/dap_python')
require('plugins/dap_ui')
require('plugins/vim_rainbow')
-- require('plugins/diffview')
-- require('plugins/neo-tree')
-- require('plugins/notify')

require'lspconfig'.pyright.setup{}

