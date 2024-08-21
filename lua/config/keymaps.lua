local map = vim.keymap.set

-- move between splits/windows
map("n", "<C-h>", "<C-w>h")
map("n", "<C-j>", "<C-w>j")
map("n", "<C-k>", "<C-w>k")
map("n", "<C-l>", "<C-w>l")

-- quit and save
map({ "i", "x", "n", "s" }, "<C-s>", "<cmd>w<cr><esc>")
map("n", "<leader>q", "<CMD>qa<CR>")

-- resize lines
map("n", "<C-Up>", "<cmd>resize +2<cr>")
map("n", "<C-Down>", "<cmd>resize -2<cr>")
map("n", "<C-Left>", "<cmd>vertical resize -2<cr>")
map("n", "<C-Right>", "<cmd>vertical resize +2<cr>")

-- Move Lines
map("n", "<A-j>", "<cmd>m .+1<cr>==")
map("n", "<A-k>", "<cmd>m .-2<cr>==")
map("i", "<A-j>", "<esc><cmd>m .+1<cr>==gi")
map("i", "<A-k>", "<esc><cmd>m .-2<cr>==gi")
map("v", "<A-j>", ":m '>+1<cr>gv=gv")
map("v", "<A-k>", ":m '<-2<cr>gv=gv")

-- Move between buffers
map("n", "<S-h>", "<cmd>bprevious<cr>")
map("n", "<S-l>", "<cmd>bnext<cr>")

-- Clear search with <esc>
map({ "i", "n" }, "<esc>", "<cmd>noh<cr><esc>")

-- Insert a new line below
map("i", "<S-CR>", "<ESC>o")

-- Add undo break-points
map("i", ",", ",<c-g>u")
map("i", ".", ".<c-g>u")
map("i", ";", ";<c-g>u")

-- better indenting
map("v", "<", "<gv")
map("v", ">", ">gv")

-- Enter normal mode in terminal
map("t", "<esc><esc>", "<c-\\><c-n>")

-- Open Lazy
map("n", "<leader>L", "<cmd>Lazy<cr>")

map("n", "<C-u>", "<C-u>zz", { desc = "scroll up and center" })
map("n", "<C-d>", "<C-d>zz", { desc = "scroll down and center" })
map("n", "n", "nzzzv", { desc = "keep cursor centered" })
map("n", "N", "Nzzzv", { desc = "keep cursor centered" })
