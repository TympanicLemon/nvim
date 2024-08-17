return {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = { 
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons",
        "MunifTanjim/nui.nvim",
    },
    config = function()
        -- Default Neo-tree setup
        require("neo-tree").setup({
            open_files_do_not_replace_types = { "terminal", "qf", "Outline" },
            filesystem = {
                filtered_items = {
                    always_show = {
                        ".zshrc",
                        ".ideavimrc",
                        ".gitignore",
                    },
                },
                follow_current_file = { enabled = true },
            },
            default_component_configs = {
                indent = {
                    padding = 0,
                    with_expanders = true,
                    expander_collapsed = "",
                    expander_expanded = "",
                },
                icon = {
                    folder_closed = "",
                    folder_open = "",
                    folder_empty = "",
                    folder_empty_open = "",
                    default = "󰈙",
                },
                modified = { symbol = "" },
                git_status = {
                    symbols = {
                        added = "",
                        deleted = "",
                        modified = "",
                        renamed = "➜",
                        untracked = "★",
                        ignored = "◌",
                        unstaged = "✗",
                        staged = "✓",
                        conflict = "",
                    },
                },
            },
            window = {
                position = "left",
            },
        })

        -- Key mapping to toggle Neo-tree
        vim.keymap.set("n", "<leader>e", function()
            require("neo-tree.command").execute({
                toggle = true,
                position = "left",
            })
        end)

        -- Refresh Neo-tree git status when lazygit is closed
        vim.api.nvim_create_autocmd("TermClose", {
            pattern = "*lazygit",
            callback = function()
                if package.loaded["neo-tree.sources.git_status"] then
                    require("neo-tree.sources.git_status").refresh()
                end
            end,
        })

        -- Autocmd to open Neo-tree in the current window if opening Neovim with a directory
        vim.api.nvim_create_autocmd("VimEnter", {
            callback = function()
                local arg = vim.fn.argv(0)
                if vim.fn.isdirectory(arg) == 1 then
                    require("neo-tree").setup({
                        window = {
                            position = "current",  -- Open in current window if a directory is opened
                        },
                    })
                    vim.cmd("Neotree reveal")
                end
            end
        })
    end,
}
