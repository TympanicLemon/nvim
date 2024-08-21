return {
    {
        "williamboman/mason.nvim",
        config = function()
            require("mason").setup()
        end,
    },

    {
        "williamboman/mason-lspconfig.nvim",
        dependencies = { "mason.nvim" },
        config = function()
            require("mason-lspconfig").setup_handlers({
                function(server_name)
                    require("lspconfig")[server_name].setup({})
                end,
            })
        end,
    },

    {
        "WhoIsSethDaniel/mason-tool-installer.nvim",
        dependencies = { "mason.nvim", "mason-lspconfig.nvim" },
        config = function()
            require("mason-tool-installer").setup({
                ensure_installed = {
                    -- LSPs
                    "clangd",
                    "lua-language-server",
                    "pyright",
                    "rust-analyzer",

                    -- Formatters
                    "stylua",
                    "clang-format",
                },

                integrations = {
                    ["mason-lspconfig"] = true,
                },
            })
        end,
    },
}
