return {
    {
        "brenoprata10/nvim-highlight-colors",
        opts = {},
    },

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
        "mbbill/undotree",
        config = function()
            vim.g.undotree_SplitWidth = 40
            vim.g.undotree_DiffpanelHeight = 20
            vim.g.undotree_DiffAutoOpen = 0

            vim.keymap.set("n", "<leader>U", vim.cmd.UndotreeToggle)
        end,
    },

    {
        "folke/lazydev.nvim",
        ft = "lua",
        opts = {
            library = {
                -- See the configuration section for more details
                -- Load luvit types when the `vim.uv` word is found
                { path = "luvit-meta/library", words = { "vim%.uv" } },
            },
        },
    },

    { "Bilal2453/luvit-meta", lazy = true },

    {
        "hrsh7th/nvim-cmp",
        opts = function(_, opts)
            opts.sources = opts.sources or {}
            table.insert(opts.sources, {
                name = "lazydev",
                group_index = 0,
            })
        end,
    },
}
