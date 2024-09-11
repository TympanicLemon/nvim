local map = vim.keymap.set

map("n", "<C-h>", "<C-w>h", { desc = "Move to left split" })
map("n", "<C-j>", "<C-w>j", { desc = "Move to below split" })
map("n", "<C-k>", "<C-w>k", { desc = "Move to above split" })
map("n", "<C-l>", "<C-w>l", { desc = "Move to right split" })
map("n", "<S-h>", "<CMD>bprevious<CR>", { desc = "Previous buffer" })
map("n", "<S-l>", "<CMD>bnext<CR>", { desc = "Next buffer" })
map("n", "<leader>w", "<CMD>w<CR><ESC>")
map("n", "<leader>q", "<CMD>qa<CR>", { desc = "Quit all" })
map("i", "<S-CR>", "<ESC>o", { desc = "Insert new line below" })
map("v", "<", "<gv", { desc = "Better indenting" })
map("v", ">", ">gv", { desc = "Better indenting" })
map({ "i", "n" }, "<ESC>", "<CMD>noh<CR><ESC>", { desc = "Clear search highlights" })
