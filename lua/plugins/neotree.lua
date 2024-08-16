return {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = { 
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons",
        "MunifTanjim/nui.nvim",
    },
    config = function()
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
            }
        })

        vim.keymap.set("n", "<leader>e", "<CMD>Neotree toggle<CR>")

        vim.api.nvim_create_autocmd("TermClose", {
            pattern = "*lazygit",
            callback = function()
                if package.loaded["neo-tree.sources.git_status"] then
                    require("neo-tree.sources.git_status").refresh()
                end
            end,
        })
    end,
}
