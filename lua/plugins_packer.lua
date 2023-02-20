local ensure_packer = function()
		local fn = vim.fn
		local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
		if fn.empty(fn.glob(install_path)) > 0 then
				fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
				vim.cmd [[packadd packer.nvim]]
				return true
		end
		return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)
		use 'wbthomason/packer.nvim';

		--replace vim-startify
		use {
				'goolord/alpha-nvim', requires = { 'nvim-tree/nvim-web-devicons' },
				config = function () require'alpha'.setup(require'alpha.themes.startify'.config) end };

				-- replace 'tpope/vim-commentary'
				use { 'numToStr/Comment.nvim', config = function() require('Comment').setup() end }

				use {"nvim-treesitter/nvim-treesitter", build = ":TSUpdate"}

				use    'neovim/nvim-lspconfig'
				use "tweekmonster/startuptime.vim";

				-- use 'dag/vim-fish'
				-- use 'tpope/vim-rsi'
				-- use 'vim-airline/vim-airline'
				-- use 'tpope/vim-surround'
				-- use 'tpope/vim-repeat'
				-- use 'KabbAmine/vCoolor.vim' -- color picker

				-- use {'neoclide/coc.nvim', branch='release', }

				if packer_bootstrap then
						require('packer').sync()
				end
		end)
