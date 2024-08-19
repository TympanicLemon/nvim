return {
    "nvim-telescope/telescope.nvim",
    event = "VimEnter",
    branch = "0.1.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
        { "nvim-telescope/telescope-ui-select.nvim" },
        { "nvim-tree/nvim-web-devicons" },
    },
    config = function()
        local actions = require("telescope.actions")
        require("telescope").setup({
            defaults = {
                path_display = { "smart" },
                mappings = {
                    i = {
                        ["<C-k>"] = actions.move_selection_previous,
                        ["<C-j>"] = actions.move_selection_next,
                    },
                },
            },
            extensions = {
                ["ui-select"] = {
                    require("telescope.themes").get_dropdown(),
                },
            },
        })

        require("telescope").load_extension("fzf")
        require("telescope").load_extension("ui-select")

        local builtin = require("telescope.builtin")
        vim.keymap.set("n", "<leader><leader>", builtin.find_files, { desc = "find files" })
        vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "find files" })
        vim.keymap.set("n", "<leader>fr", builtin.oldfiles, { desc = "find recent files" })
        vim.keymap.set("n", "<leader>fw", builtin.grep_string, { desc = "find current word" })
        vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "find by grep" })
        vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "find help" })
        vim.keymap.set("n", "<leader>fk", builtin.keymaps, { desc = "find keymaps" })
        vim.keymap.set("n", "<leader>fd", builtin.diagnostics, { desc = "find diagnostics" })
    end,
}
