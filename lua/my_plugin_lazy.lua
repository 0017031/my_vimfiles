-- my_plugin_lazy.lua

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({ "git", "clone", "--depth=1", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", lazypath, })
end

vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    'neovim/nvim-lspconfig',
    'tpope/vim-rsi', -- Readline mappings, in insert mode and command line mode
    'vim-airline/vim-airline',
    'tpope/vim-surround',
    "tweekmonster/startuptime.vim",
    -- 'tpope/vim-repeat',
    { -- replace vim-startify
        'goolord/alpha-nvim',
        config = function() require 'alpha'.setup(require 'alpha.themes.startify'.config) end,
        dependencies = { 'nvim-tree/nvim-web-devicons' }
    },
    { -- replace 'tpope/vim-commentary',
        'numToStr/Comment.nvim',
        config = function() require('Comment').setup() end
    },

    { -- fish
        'dag/vim-fish',
        ft = "fish"
    },
    { -- jsonc
        'neoclide/jsonc.vim',
        ft = { "json", "jsonc" }
    },

    -- { 'neoclide/coc.nvim', branch = 'release', },



    -- {
    -- 	'nathom/filetype.nvim',
    -- 	config = function() require 'filetype'.setup({
    -- 		overrides = {
    -- 			literal = {
    -- 				-- Set the filetype of files named "MyBackupFile" to lua
    -- 				buildfile = "buildfile",
    -- 			},
    -- 			extensions = {
    -- 				-- Set the filetype of *.pn files to potion
    -- 				buildfile = "buildfile",
    -- 			},
    -- 			-- function_literal = {
    -- 			--         buildfile = function()
    -- 			--             vim.treesitter.start()
    -- 			--         end,
    -- 			--     },
    -- 		}}) end,
    -- },

    -- 'tpope/vim-fugitive', -- git for vim

    -- 'KabbAmine/vCoolor.vim', -- color picker,
    -- "folke/which-key.nvim",
    -- { "folke/neoconf.nvim", cmd = "Neoconf" },
    -- "folke/neodev.nvim",

    -- {
    -- "nvim-treesitter/nvim-treesitter",
    -- 	build = ":TSUpdate",
    -- 	config = function()
    -- 		-- require "nvim-treesitter.parsers".get_parser_configs().buildfile = {
    -- 	install_info = {
    -- 		url = "Z:\\tree-sitter-buildfile", -- local path or git repo
    -- 		files = { "src/parser.c" }, -- note that some parsers also require src/scanner.c or src/scanner.cc
    -- 		-- optional entries:
    -- 		branch = "main",         -- default branch in case of git repo if different from master
    -- 		generate_requires_npm = false, -- if stand-alone parser without npm dependencies
    -- 		requires_generate_from_grammar = false, -- if folder contains pre-generated src/parser.c
    -- 	},
    -- 	filetype = "buildfile",      -- if filetype does not match the parser name
    -- }

    -- 		require 'nvim-treesitter.configs'.setup {
    -- 			highlight = {
    -- 				enable = true,
    -- 				-- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- 				-- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- 				-- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- 				-- Instead of true it can also be a list of languages
    -- 				additional_vim_regex_highlighting = false,
    -- 			},
    -- 			indent = {
    -- 				enable = true
    -- 			},
    -- 		}
    -- 	end,
    -- },
    -- { 'nvim-treesitter/playground' },

    -- { -- fuzzy finder over lists
    --     'nvim-telescope/telescope.nvim',
    --     tag = '0.1.5',
    --     branch = '0.1.x',
    --     dependencies = { 'nvim-lua/plenary.nvim' } -- lua lib

    -- },
    -- { -- A search panel for neovim.
    --     'nvim-pack/nvim-spectre',
    --     config = function()
    --         vim.keymap.set('n', '<leader>q', '<cmd>lua require("spectre").toggle()<CR>', {
    --             desc = "Toggle Spectre"
    --         })
    --         vim.keymap.set('n', '<leader>sw', '<cmd>lua require("spectre").open_visual({select_word=true})<CR>', {
    --             desc = "Search current word"
    --         })
    --         vim.keymap.set('v', '<leader>sw', '<esc><cmd>lua require("spectre").open_visual()<CR>', {
    --             desc = "Search current word"
    --         })
    --         vim.keymap.set('n', '<leader>sp', '<cmd>lua require("spectre").open_file_search({select_word=true})<CR>', {
    --             desc = "Search on current file"
    --         })
    --     end

    -- },

})
