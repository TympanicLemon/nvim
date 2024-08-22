return {
    {
        "neovim/nvim-lspconfig",
        config = function()
            vim.keymap.set("n", "<leader>la", vim.lsp.buf.code_action, { desc = "LSP code action" })
            vim.keymap.set("n", "<leader>lr", vim.lsp.buf.rename, { desc = "Rename current symbol" })
            vim.keymap.set("n", "<leader>ld", vim.diagnostic.open_float, { desc = "Show line diagnostics" })

            vim.keymap.set("n", "<leader>ll", vim.lsp.codelens.refresh, { desc = "LSP CodeLens refresh" })
            vim.keymap.set("n", "<leader>lR", vim.lsp.buf.references, { desc = "Search references" })

            vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "Show the definition of current symbol" })
            vim.keymap.set("n", "gi", vim.lsp.buf.implementation, { desc = "Implementation of current symbol" })

            vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Hover symbol details" })
        end,
    },
}
