--vim.cmd [[packadd packer.nvim]]

-- returns true on completion without errors
return require("packer").startup(function(use)
	-- Packer manages itself
	use("wbthomason/packer.nvim")

	-- telescope -------------
	-- plenary is required for most of the plugins , which  is installed as a dependancy for telescope
	use({
		"nvim-telescope/telescope.nvim",
		tag = "0.1.1",
		requires = {
			{
				"nvim-lua/plenary.nvim",
				"BurntSushi/ripgrep",
				"sharkdp/fd",
				"debugloop/telescope-undo.nvim",
			},
		},
	})

	--- Lsp Config -------------------------------------

	use({
		"neovim/nvim-lspconfig",
		requires = {
			-- Automatically install LSPs to stdpath for neovim
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",

			-- Useful status updates for LSP
			"j-hui/fidget.nvim",

			-- Additional lua configuration, makes nvim stuff amazing
			"folke/neodev.nvim",
			"L3MON4D3/LuaSnip",
			"hrsh7th/nvim-cmp",
			"hrsh7th/cmp-nvim-lsp",
		},
	})

	use("jose-elias-alvarez/null-ls.nvim") -- configure formatters & linters
	use("jayp0521/mason-null-ls.nvim") -- bridges gap b/w mason & null-ls

	-- Autopairs

	use("windwp/nvim-ts-autotag", { after = "nvim-treesitter" })
	use("windwp/nvim-autopairs")

	-- colorscheme -----------

	use("morhetz/gruvbox")
	use("navarasu/onedark.nvim")
	use("catppuccin/nvim")

	-- custom plugins --------

	use("andweeb/presence.nvim") -- discord presence

	use("nvim-lualine/lualine.nvim") -- statusline

	use("famiu/feline.nvim") -- statusline

	use("nvim-treesitter/nvim-treesitter", { run = ":TSUpdate" })

	use("ellisonleao/glow.nvim") -- markdown glow

	use("goolord/alpha-nvim")

	use("nvim-tree/nvim-web-devicons")

	use("nvim-tree/nvim-tree.lua") --- File Browser

	use("lewis6991/gitsigns.nvim")

	use("theprimeagen/harpoon")

	use("t-aswath/weather-reporto.nvim")

	use("brenoprata10/nvim-highlight-colors")

	use({
		"akinsho/toggleterm.nvim",
		tag = "*",
		config = function()
			require("toggleterm").setup()
		end,
	})

	-- Extras ----------------

	use("RaafatTurki/hex.nvim") -- Hex Viewer

	if is_bootstrap then
		print("Packer Sync")
		require("packer").sync()
	end

	-- Automatically source and re-compile packer whenever you save this init.lua
	local packer_group = vim.api.nvim_create_augroup("Packer", { clear = true })
	vim.api.nvim_create_autocmd("BufWritePost", {
		command = "source <afile> | silent! LspStop | silent! LspStart | PackerCompile",
		group = packer_group,
		pattern = vim.fn.expand("$MYVIMRC"),
	})

	--use 'D:/Projects/Projects/weather-report'
end)
