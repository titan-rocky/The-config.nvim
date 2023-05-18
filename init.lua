-- bootstrapping : Installing packges without running settings for first time ------------------------
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

--------------------------------- boostrapping end ----------------------------------------------------- 

require("settings")

require("colorscheme")
require("plugins")
require("lsp")
print("Hello User")

