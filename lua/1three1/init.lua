require("1three1.lazy")
require("1three1.set")
require("1three1.remap")
require("1three1.auto")

-- Spacebar as leader key
vim.g.mapleader = " "

vim.cmd("colorscheme tokyonight")

function R(name)
	require("plenary.reload").reload_module(name)
end


