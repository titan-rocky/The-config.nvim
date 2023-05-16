-- disable netrw at the very start of your init.lua (strongly advised)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

local setup, nvimtree = pcall(require, "nvim-tree")
if not setup then
	return
end

-- recommended settings from nvim-tree documentation

vim.g.loaded = 1

vim.g.loaded_netrwPlugin = 1

vim.cmd([[ highlight NvimTreeSymlinkFolderName guifg=##83a598]])
vim.cmd([[ highlight NvimTreeOpenedFolderName guifg=##83a598]])
vim.cmd([[ highlight NvimTreeRootFolder guifg=#AEC490]])
vim.cmd([[ highlight NvimTreeFolderIcon guifg=#83A598]])

vim.cmd([[ highlight NvimTreeWindowPicker guibg=##83a598]])
vim.cmd([[ highlight NvimTreeIndentMarker guifg=#C69D54]])

vim.cmd([[ highlight NvimTreeOpenedFile guifg=#D38275]])
vim.cmd([[ highlight NvimTreeSpecialFile guifg=#D38275]])

nvimtree.setup({
	renderer = {
		icons = {
			glyphs = {
				default = "",
				symlink = "",
				bookmark = "",
				modified = "●",
				folder = {
					arrow_closed = "",
					arrow_open = "",
					default = "",
					open = "",
					empty = "",
					empty_open = "",
					symlink = "",
					symlink_open = "",
				},
				git = {
					unstaged = "✗",
					staged = "✓",
					unmerged = "",
					renamed = "➜",
					untracked = "★",
					deleted = "",
					ignored = "◌",
				},
			},
		},
	},
	actions = {
		open_file = {
			window_picker = {
				enable = false,
			},
		},
	},
})
