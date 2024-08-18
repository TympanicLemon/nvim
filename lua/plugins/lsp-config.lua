return {
    {
        "neovim/nvim-lspconfig",
        config = function()
            vim.keymap.set("n", "<leader>la", vim.lsp.buf.code_action, { desc = "LSP code action" })
            vim.keymap.set("n", "<leader>lr", vim.lsp.buf.rename, { desc = "Rename current symbol" })

            vim.keymap.set("n", "<leader>ll", vim.lsp.codelens.refresh, { desc = "LSP CodeLens refresh" })
            vim.keymap.set("n", "<leader>lR", vim.lsp.buf.references, { desc = "Search references" })

            vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "Show the definition of current symbol" })
            vim.keymap.set("n", "gi", vim.lsp.buf.implementation, { desc = "Implementation of current symbol" })

            vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Hover symbol details" })
        end,
    },

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
                    "lua-language-server",
                    "clangd",

                    -- Formatters
                    "stylua",
                    "black",
                    "isort",
                    "clang-format",

                    -- Debuggers
                    "codelldb",
                },

                integrations = {
                    ["mason-lspconfig"] = true,
                    ["mason-nvim-dap"] = true,
                },
            })
        end,
    },
}
