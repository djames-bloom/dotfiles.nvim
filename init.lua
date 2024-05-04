-- Use lazy now that packer is dead
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

-- Self install if lazy not already installed
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end

vim.opt.rtp:prepend(lazypath)

-- Load Config
require("1three1")
