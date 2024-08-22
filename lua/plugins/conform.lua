return {
    "stevearc/conform.nvim",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
        local conform = require("conform")
        conform.setup({
            formatters_by_ft = {
                c = { "clang_format" },
                lua = { "stylua" },
                python = { "isort", "black" },
            },
            formatters = {
                clang_format = {
                    args = { "--style", "{IndentWidth: 4}" },
                },
            },
            format_on_save = function(bufnr)
                if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
                    return
                end
                return { timeout_ms = 500 }
            end,
        })

        -- Keymap to format file or range
        vim.keymap.set({ "n", "v" }, "<leader>lf", function()
            conform.format({
                lsp_fallback = true,
                async = false,
                timeout_ms = 1000,
            })
        end, { desc = "Format file or range (in visual mode)" })

        -- Commands to toggle formatting
        vim.api.nvim_create_user_command("FormatDisable", function(args)
            if args.bang then
                vim.b.disable_autoformat = true
            else
                vim.g.disable_autoformat = true
            end
        end, {
            desc = "Disable autoformat-on-save",
            bang = true,
        })

        vim.api.nvim_create_user_command("FormatEnable", function()
            vim.b.disable_autoformat = false
            vim.g.disable_autoformat = false
        end, {
            desc = "Re-enable autoformat-on-save",
        })

        -- Toggle format on save for buffer
        vim.keymap.set("n", "<leader>uf", function()
            if vim.b.disable_autoformat then
                vim.cmd("FormatEnable")
                print("Autoformat enabled for this buffer")
            else
                vim.cmd("FormatDisable!")
                print("Autoformat disabled for this buffer")
            end
        end, { noremap = true, silent = true, desc = "Toggle buffer-wide autoformat" })

        -- Toggle format on save globally
        vim.keymap.set("n", "<leader>uF", function()
            if vim.g.disable_autoformat then
                vim.cmd("FormatEnable")
                print("Autoformat enabled globally")
            else
                vim.cmd("FormatDisable")
                print("Autoformat disabled globally")
            end
        end, { noremap = true, silent = true, desc = "Toggle global autoformat" })
    end,
}
