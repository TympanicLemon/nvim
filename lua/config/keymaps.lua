local map = vim.keymap.set

-- Window Navigation
map("n", "<C-h>", "<C-w>h", { desc = "Move to left split" })
map("n", "<C-j>", "<C-w>j", { desc = "Move to below split" })
map("n", "<C-k>", "<C-w>k", { desc = "Move to above split" })
map("n", "<C-l>", "<C-w>l", { desc = "Move to right split" })

-- Buffer Navigation
map("n", "<S-h>", "<CMD>bprevious<CR>", { desc = "Previous buffer" })
map("n", "<S-l>", "<CMD>bnext<CR>", { desc = "Next buffer" })

-- Resizing Splits
map("n", "<C-Up>", "<CMD>resize +2<CR>", { desc = "Increase height" })
map("n", "<C-Down>", "<CMD>resize -2<CR>", { desc = "Decrease height" })
map("n", "<C-Left>", "<CMD>vertical resize -2<CR>", { desc = "Decrease width" })
map("n", "<C-Right>", "<CMD>vertical resize +2<CR>", { desc = "Increase width" })

-- Line Movement
map("n", "<A-j>", "<CMD>m .+1<CR>==", { desc = "Move line down" })
map("n", "<A-k>", "<CMD>m .-2<CR>==", { desc = "Move line up" })
map("i", "<A-j>", "<esc><CMD>m .+1<CR>==gi", { desc = "Move line down in insert mode" })
map("i", "<A-k>", "<esc><CMD>m .-2<CR>==gi", { desc = "Move line up in insert mode" })
map("v", "<A-j>", ":m '>+1<CR>gv=gv", { desc = "Move selection down" })
map("v", "<A-k>", ":m '<-2<CR>gv=gv", { desc = "Move selection up" })

-- Editing Enhancements
map({ "i", "x", "n", "s" }, "<C-s>", "<CMD>w<CR><esc>", { desc = "Save file" })
map("n", "<leader>q", "<CMD>qa<CR>", { desc = "Quit all" })
map("i", "<S-CR>", "<ESC>o", { desc = "Insert new line below" })
map("i", ",", ",<c-g>u", { desc = "Add undo break after comma" })
map("i", ".", ".<c-g>u", { desc = "Add undo break after period" })
map("i", ";", ";<c-g>u", { desc = "Add undo break after semicolon" })
map("v", "<", "<gv", { desc = "Better indenting" })
map("v", ">", ">gv", { desc = "Better indenting" })

-- Centering Scroll
map("n", "<C-u>", "<C-u>zz", { desc = "Scroll up and center" })
map("n", "<C-d>", "<C-d>zz", { desc = "Scroll down and center" })
map("n", "n", "nzzzv", { desc = "Keep cursor centered after search" })
map("n", "N", "Nzzzv", { desc = "Keep cursor centered after reverse search" })

-- Miscellaneous
map({ "i", "n" }, "<esc>", "<CMD>noh<CR><esc>", { desc = "Clear search highlights" })
map("t", "<esc><esc>", "<c-\\><c-n>", { desc = "Enter normal mode in terminal" })
map("n", "<leader>L", "<CMD>Lazy<CR>", { desc = "Open Lazy" })
map("n", "<leader>ya", "ggyG", { desc = "Yank all" })
