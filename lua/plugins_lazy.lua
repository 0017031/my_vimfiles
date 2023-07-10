local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({ "git", "clone", "--depth=1", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", lazypath, })
end

vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  -- replace vim-startify
  {
    'goolord/alpha-nvim',
    config = function() require 'alpha'.setup(require 'alpha.themes.startify'.config) end,
    dependencies = { 'nvim-tree/nvim-web-devicons' }
  },

  -- replace 'tpope/vim-commentary',
  { 'numToStr/Comment.nvim',           config = function() require('Comment').setup() end },

  { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
  { "nvim-treesitter/playground" },

  -- 'tpope/vim-fugitive', -- git for vim
  'neovim/nvim-lspconfig',

  'dag/vim-fish',

  'tpope/vim-rsi',
  'vim-airline/vim-airline',
  'tpope/vim-surround',
  -- 'tpope/vim-repeat',
  -- 'KabbAmine/vCoolor.vim', -- color picker,
  { 'neoclide/coc.nvim', branch = 'release', },

  'neoclide/jsonc.vim',


  "tweekmonster/startuptime.vim",

  -- "folke/which-key.nvim",
  -- { "folke/neoconf.nvim", cmd = "Neoconf" },
  -- "folke/neodev.nvim",

}) --lazy
