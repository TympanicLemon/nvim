vim.g.mapleader = " "

vim.opt.backup = false
vim.opt.clipboard = "unnamedplus"
vim.opt.completeopt = { "menu", "menuone", "noselect" }
vim.opt.confirm = true
vim.opt.cursorline = true
vim.opt.expandtab = true
vim.opt.grepprg = "rg --vimgrep"
vim.opt.ignorecase = true
vim.opt.mouse = "a"
vim.opt.nu = true
vim.opt.rnu = true
vim.opt.pumheight = 10
vim.opt.scrolloff = 8
vim.opt.shiftwidth = 0
vim.opt.showmode = false
vim.opt.signcolumn = "yes"
vim.opt.smartcase = true
vim.opt.smartindent = true
vim.opt.splitbelow = true
vim.opt.splitkeep = "screen"
vim.opt.splitright = true
vim.opt.swapfile = false
vim.opt.termguicolors = true
vim.opt.tabstop = 4
vim.opt.title = true
vim.opt.undodir = os.getenv "HOME" .. "/.vim/undodir"
vim.opt.undofile = true
vim.opt.virtualedit = "block"
vim.opt.wrap = false
vim.opt.writebackup = false


