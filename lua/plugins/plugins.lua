return {
    {
        "sainnhe/gruvbox-material",
        lazy = false,
        priority = 1000,
        config = function()
            vim.cmd("colorscheme gruvbox-material")
        end,
    },


    {
        "max397574/better-escape.nvim",
        config = function()
            require("better_escape").setup()
        end,
    },

    {
        "kdheepak/lazygit.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
        keys = { { "<leader>gg", "<cmd>LazyGit<cr>", desc = "LazyGit" } },
    },
    
    {
        "mbbill/undotree",
        config = function()
            vim.g.undotree_SplitWidth = 40
            vim.g.undotree_DiffpanelHeight = 20

            vim.keymap.set("n", "<leader>U", vim.cmd.UndotreeToggle)
        end,
    },
}
