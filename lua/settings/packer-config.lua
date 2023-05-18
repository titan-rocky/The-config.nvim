vim.cmd [[packadd packer.nvim]]

return require("packer").startup(function(use)
	use {'wbthomason/packer.nvim'}
	use { 'nvim-telescope/telescope.nvim' ,
		requires = {
                    {'nvim-lua/plenary.nvim'},
                    {'BurntSushi/ripgrep'},
	            {'sharkdp/fd'}
                }
 	}
	use {'debugloop/telescope-undo.nvim'}
	use {'nvim-treesitter/nvim-treesitter' , run = ':TSUpdate' }
	use {'nvim-treesitter/playground'}

	-- Language Server Protocol (LSP) --
	use {'neovim/nvim-lspconfig'}  -- Native LSP config
    	use {'williamboman/mason.nvim',run = function() pcall(vim.cmd, 'MasonUpdate') end} -- Mason for LSP management
	use {'williamboman/mason-lspconfig.nvim'} -- Bridge betweem Mason and nvim-lspconfig
        use {'glepnir/lspsaga.nvim' , branch = 'main' } -- Easier Config
        use {'onsails/lspkind.nvim'} -- vs-code like icons for autocompletion
        use {'folke/neodev.nvim'}

    	-- Autocompletion
    	use {'hrsh7th/nvim-cmp'}     -- Required
    	use {'hrsh7th/cmp-buffer'}     -- Required
    	use {'hrsh7th/cmp-path'}     -- Required
    	use {'hrsh7th/cmp-nvim-lsp'} -- Required
        use {'jose-elias-alvarez/null-ls.nvim'} --  LSP diagnostics, code actions, etc
        use {'jayp0521/mason-null-ls.nvim'} -- bridges gap b/w mason & null-ls
        use {'github/copilot.vim' , run = ":Copilot setup"}

        -- Snippets --
    	use {'L3MON4D3/LuaSnip'}     -- Lua Snippets
        use {'saadparwaiz1/cmp_luasnip'}
        use {'rafamadriz/friendly-snippets'}


        -- Autopairs --
        use {'windwp/nvim-autopairs'} -- Autopairs
        use {'windwp/nvim-ts-autotag' , after = "nvim-treesitter" } -- HTML/XML Tag autocompletion

	-- Custom Plugins
	use {'andweeb/presence.nvim'} -- Discord Presence
	use {'theprimeagen/harpoon'} -- Easy switch between files
	use {'mbbill/undotree'} -- Tree visualizer of past changes
	use {'tpope/vim-fugitive'} -- 
        use {'famiu/feline.nvim'}
        use {'nvim-lualine/lualine.nvim'}
        use {'nvim-tree/nvim-tree.lua'}
        use {'nvim-tree/nvim-web-devicons'}
        use {'lewis6991/gitsigns.nvim'}
        use {'goolord/alpha-nvim'} -- Dashboard

	-- Color Schemes
	use {'catppuccin/nvim'}
        use {'morhetz/gruvbox'}

        -- Extras
        use {'t-aswath/weather-reporto.nvim'} -- OPGG
        use {'brenoprata10/nvim-highlight-colors'} -- color highlights
        use {'sudoerwx/vim-ray-so-beautiful'}

    -- Automatically source and re-compile packer whenever you save this init.lua
    local packer_group = vim.api.nvim_create_augroup('Packer', { clear = true })
    vim.api.nvim_create_autocmd('BufWritePost', {
        command = 'source <afile> | silent! LspStop | silent! LspStart | PackerCompile',
        group = packer_group,
        pattern = vim.fn.expand '$MYVIMRC',
    })
end)
