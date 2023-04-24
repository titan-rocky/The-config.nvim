local keymap = vim.keymap

vim.g.mapleader = " "
vim.g.maplocalleader = " "

--- Telescope ---------------------------------------------------------------------------------------------

local builtin = require("telescope.builtin")
keymap.set("n", "<leader>pf", builtin.find_files, {}) -- project find
keymap.set("n", "<C-p>", builtin.git_files, {}) -- git search
keymap.set("n", "<leader>ps", function()
	builtin.grep_string({ search = vim.fn.input("Grep > ") })
end)
keymap.set("n", "<leader>pc", "<cmd>Telescope live_grep<CR>") -- Searching in current working directory
keymap.set("n", "<leader>ph", "<cmd>Telescope help_tags<CR>") -- list available help tags
keymap.set("n", "<leader>pr", "<cmd>Telescope oldfiles<CR>") -- load recent files

--- Telescope Extensions ----------------------------------------------------------------------------------

keymap.set("n", "<leader>u", "<cmd>Telescope undo<cr>") -- undo tree

--- General -----------------------------------------------------------------------------------------------

keymap.set("n", "i", "i")
keymap.set("i", "jj", "<ESC>") -- i -> n
keymap.set("n", "<leader>c", ":nohl<CR>") --cls search
keymap.set("n", "x", "_x", { noremap = true }) --delete without copy
keymap.set("n", "X", "lX", { noremap = true }) --delete current char under cursor
keymap.set("n", "<leader>+", "<C-a>") --increment
keymap.set("n", "<leader>-", "<C-x>") --decrement

keymap.set("n", "<leader>sv", "<C-w>v") -- split window vertically
keymap.set("n", "<leader>sh", "<C-w>s") -- split window horizontally
keymap.set("n", "<leader>se", "<C-w>=") -- make split windows equal width & height
keymap.set("n", "<leader>sx", ":close<CR>") -- close current split window

keymap.set("n", "<leader>tn", ":tabnew<CR>") -- open new tab
keymap.set("n", "<leader>tc", ":tabclose<CR>") -- close current tab
keymap.set("n", "<leader>tr", ":tabn<CR>") --  go to next tab
keymap.set("n", "<leader>tl", ":tabp<CR>") --  go to previous tab

--- Programming Execution ----------------------------------------------------------------------------------

keymap.set("n", "<A-p>", ":!python3 %:r.py<CR>")
keymap.set("n", "<A-c>", ":!gcc %:r.c -o %:r.out && %:r.out<CR>")
keymap.set("n", "<A-g>", ":!g++ %:r.cpp -o %:r.out && %:r.out<CR>")

--- NvimTree -----------------------------------------------------------------------------------------------

keymap.set("n", "<leader>tt", "<cmd>NvimTreeToggle<CR>")

--- LspConfig : Refer lua/lsp/lsp-config.lua for nmap keys -------------------------------------------------

-- Harpoon -------------------------------------------------------------------------------------------------
keymap.set("n", "<C-S>", ':lua require("harpoon.mark").add_file()<CR>')
keymap.set("n", "<A-t>", ':lua require("harpoon.ui").toggle_quick_menu()<CR>')
keymap.set("n", "<A-j>", ':lua require("harpoon.ui").nav_next()<CR>')
keymap.set("n", "<A-k>", ':lua require("harpoon.ui").nav_prev()<CR>')

-- Terminal Toggle ----------------------------------------------------------------------------------------
keymap.set("n", "<A-s>", ":ToggleTerm<CR>")
