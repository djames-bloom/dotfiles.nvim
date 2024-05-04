-- Set new splits
vim.g.netrw_browse_split = 0
vim.g.netrw_banner = 0
vim.g.netrw_winsize = 25

-- Auto tabs without .editorconfig
vim.opt_local.shiftwidth = 4
vim.opt_local.tabstop = 4
vim.opt_local.softtabstop = 4

-- Self indent and handle wrapping on lll
vim.opt.smartindent = true
vim.opt.wrap = false

-- Wildmode menu
vim.opt.wildmode = "longest:full,full"
vim.opt.wildmenu = true
vim.opt.wildignore = {
	"*.o", "*.obj", "*.bin", "*.dll", "*.exe", "*.pyc", "*.pyo", "*.class",
	"*_build/*", "*/.git/*", "*/.hg/*", "*/.svn/*", "*/.DS_Store/*",
	"*/.vscode/*", "*/.cache/*", "*/.pytest_cache/*", "*/.mypy_cache/*",
	"*/.venv/*", "*/.tox/*", "*/.env/*", "*/.direnv/*", "*/.terraform/*",
	"/target/*", "/dist/*", "/build/*", "/node_modules/*", "/.next/*",
	"/.nuxt/*", "/.cache/*", "/.stack-work/*", "/.bundle/*", "/.sass-cache/*",
	"/coverage/*", "/tmp/*", "/temp/*", "/out/*", "/public/*", "/vendor/*",
}

-- Default blinkenlights
vim.opt.guicursor = ""

-- Show line numbers
vim.opt.nu = true

-- It's always too early for math
vim.opt.relativenumber = true

-- Don't need swaps or backups on local. We have git.
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undofile = true
vim.opt.undodir = vim.fn.expand("~/.config/nvim/undodir")

-- Search helpers
vim.opt.hlsearch = true
vim.opt.incsearch = true

-- Just to keep themes pretty
vim.opt.termguicolors = true

-- Keep lines above cursor for context
vim.opt.scrolloff = 8

vim.opt.isfname:append("@-@")
vim.opt.signcolumn = "yes"
vim.opt.updatetime = 50
vim.opt.colorcolumn = "80"
