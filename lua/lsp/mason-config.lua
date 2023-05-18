local mason = require("mason")
local masonconfig = require("mason-lspconfig")


mason.setup({
	ui = {
		icons = {
			package_installed = "✓",
			package_pending = "➜",
			package_uninstalled = "✗",
		},
	},
})

masonconfig.setup({
    ensure_installed = {
        "lua_ls",
        "rust_analyzer",
        "html",
        "cssls",
        "tailwindcss",
        "tsserver",
        "stylua", -- for null lsp
        "eslint", -- for null lsp
    }
})


local mason_null_ls = require('mason-null-ls')

mason_null_ls.setup({
	-- list of formatters & linters for mason to install
	ensure_installed = {
		"stylua", -- lua formatter
		"prettier",
	},
	-- auto-install configured formatters & linters (with null-ls)
	automatic_installation = true,
})
