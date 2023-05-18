local lspconfig = require("lspconfig")
local mason_lspconfig = require("mason-lspconfig")

local languages = {
    lua_ls = {
        Lua = {
            diagnostics = {
                globals = { "vim" },
            },
            workspace = {
                {
                    Library = {
                        [vim.fn.expand("$VIMRUNTIME/lua") ] = true ,
                        [vim.fn.stdpath("config") .. "/lua" ] = true ,

                    },
                    checkThirdParty = false
                },
            },
            telemetry = { enable = 'false' },
        }
    },
    cssls = {},
    rust_analyzer = {},
    tailwindcss = {},
    html = {},
    tsserver = {},
    pyright = {},
}

--- Default capabilities
local capabilities = vim.lsp.protocol.make_client_capabilities()

local capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)
--capabilities.textDocument.completion.completionItem.snippetSupport = true


local on_attach = function(client,bufnr)
	local opts = {buffer = bufnr, remap = false}
	local remap = vim.keymap.set

	remap ( 'n' , 'gd' , function() vim.lsp.buf.definitions() end,opts )
	remap ( 'n' , 'K' , function() vim.lsp.buf.hover() end,opts )
	remap ( 'n' , '<leader>vws' , function() vim.lsp.buf.workspace_symbol() end,opts )
	remap ( 'n' , '<leader>vd' , function() vim.diagnostic.open_float() end,opts )
	remap ( 'n' , '[d' , function() vim.diagnostic.goto_next() end,opts )
	remap ( 'n' , ']d' , function() vim.diagnostic.goto_prev() end,opts )
	remap ( 'n' , '<leader>vca' , function() vim.lsp.buf.code_action() end,opts )
	remap ( 'n' , '<leader>vrr' , function() vim.lsp.buf.references() end,opts )
	remap ( 'n' , '<leader>vrn' , function() vim.lsp.buf.rename() end,opts )
	remap ( 'i' , '<C-h>' , function() vim.lsp.buf.signature_help() end,opts )

end


mason_lspconfig.setup({
	ensure_installed = vim.tbl_keys(languages),
})

for server_name in pairs(languages) do
		lspconfig[server_name].setup({
			capabilities = capabilities,
			on_attach = on_attach(),
			settings = languages[server_name],
		})
end

local signs = { Error = " ", Warn = " ", Hint = "󰛩", Info = " " }
for type, icon in pairs(signs) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end


require('neodev').setup()

local null_ls = require("null-ls")

null_ls.setup({
    sources = {
        null_ls.builtins.formatting.stylua,
        null_ls.builtins.diagnostics.eslint,
        null_ls.builtins.completion.spell,
    },
})

