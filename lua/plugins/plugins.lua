return {
    {
        "shaunsingh/nord.nvim",
        config = function()
            vim.cmd("colorscheme nord")
        end,
    },


    {
        "max397574/better-escape.nvim",
        config = function()
            require("better_escape").setup()
        end,
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
