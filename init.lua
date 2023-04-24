-- bootstrapping : refer packer
local install_path = vim.fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
local is_bootstrap = false

-- checking whether the nvim is already configured
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
	is_bootstrap = true
	vim.fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
	vim.cmd([[packadd packer.nvim]])
end

require("settings/packer-config")

if is_bootstrap then
	print("Plugins are being installed")
	print("Please Wait")
	require("packer").sync()
	return
end

require("settings/init")
require("lsp/init")
require("custom-plugins/init")
require("settings/keymap")
require("colorscheme/init")

print("Welcome Back , User")
