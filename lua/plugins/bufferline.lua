return {
    "akinsho/bufferline.nvim",
    event = "VeryLazy",
    keys = {
        { "<S-h>", "<cmd>BufferLineCyclePrev<cr>", desc = "Prev Buffer" },
        { "<S-l>", "<cmd>BufferLineCycleNext<cr>", desc = "Next Buffer" },
    },
    opts = {
        options = {
            close_command = function(buf_id) require("mini.bufremove").delete(buf_id, false) end,
            right_mouse_command = function(buf_id) require("mini.bufremove").delete(buf_id, false) end,
            always_show_bufferline = false,
            diagnostics = "nvim_lsp",
            diagnostics_indicator = function(_, _, diag)
                local icons = {
                    Error = "",
                    Hint = "󰌵",
                    Info = "󰋼",
                    Warn = "",
                }

                local ret = (diag.error and icons.Error .. diag.error .. " " or "")
                .. (diag.warning and icons.Warning .. diag.warning or "")

                return vim.trim(ret)
            end,
            offsets = {
                {
                    filetype = "neo-tree",
                    text = "Neo-tree",
                    highlight = "Directory",
                    text_align = "left",
                },
            },
        },
    },
    config = function(_, opts)
        require("bufferline").setup(opts)
        vim.api.nvim_create_autocmd({ "BufAdd", "BufDelete" }, {
            callback = function()
                vim.schedule(function()
                    pcall(nvim_bufferline)
                end)
            end,
        })

        -- Ensure MiniBufremove is loaded before using it in the keymap
        vim.keymap.set("n", "<leader>bd", function() require("mini.bufremove").delete(0, false) end)
    end,
}
