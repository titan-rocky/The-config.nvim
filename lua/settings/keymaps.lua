vim.g.mapleader = " "

local keymap = vim.keymap.set


--keymap ( 'n' , '<leader>t' , vim.cmd.Ex) --Netrw disabled
-- File Explorer --
keymap( 'n' , '<leader>t' , ':NvimTreeToggle<CR>' )



-- Telescope --
local builtin = require("telescope.builtin")

keymap ( 'n' , '<leader>pf' , builtin.find_files , {} ) -- finds all files
keymap ( 'n' , '<C-p>' , builtin.git_files , {} ) -- finds git files
keymap ( 'n' , '<leader>ps' , function ()
	builtin.grep_string( { search = vim.fn.input("Grep > ") } )
end)
vim.keymap.set('n', '<leader>pg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>pb', builtin.buffers, {})
vim.keymap.set('n', '<leader>ph', builtin.help_tags, {})


-- Harpoon --
local mark = require("harpoon.mark")
local ui = require("harpoon.ui")

keymap ( 'n' , '<C-s>' , mark.add_file)
keymap ( 'n' , '<C-e>' , ui.toggle_quick_menu)

keymap ( 'n' , '<A-j>' , function () ui.nav_file(1) end)
keymap ( 'n' , '<A-k>' , function () ui.nav_file(2) end)

-- UndoTree --
keymap ( 'n' , '<leader>u' , '<cmd>Telescope undo<CR>')

-- Fugitive --
keymap ( 'n' , '<leader>gs' , function ()
	local ok , err = pcall(vim.cmd.Git)
	if (err) then
		print(err)
	end
end)


-- Compilation --
keymap ( 'n' , '<A-p>' , '!:python3 %<CR>' )




