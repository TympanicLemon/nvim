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
      filesystem = {
        filtered_items = {
          visible = true,
          hide_dotfiles = false,
          hide_hidden = false,
        },
        follow_current_file = { enabled = true },
        commands = {
          -- Override delete to use trash instead of rm
          delete = function(state)
            local inputs = require("neo-tree.ui.inputs")
            local path = state.tree:get_node().path
            local msg = "Are you sure you want to trash " .. path

            inputs.confirm(msg, function(confirmed)
              if not confirmed then return end
              
              -- Find and close the buffer before trashing the file
              local bufnr = vim.fn.bufnr(path)
              if bufnr > 0 and vim.api.nvim_buf_is_loaded(bufnr) then
                vim.api.nvim_buf_delete(bufnr, { force = true })
              end
              
              vim.fn.system({ "trash", vim.fn.fnameescape(path) })
              require("neo-tree.sources.manager").refresh(state.name)
            end)
          end,
          
          -- Handle visual mode selection (multiple files)
          delete_visual = function(state, selected_nodes)
            local inputs = require("neo-tree.ui.inputs")
            local count = #selected_nodes
            local msg = "Are you sure you want to trash " .. count .. " files?"
            
            inputs.confirm(msg, function(confirmed)
              if not confirmed then return end
              
              for _, node in ipairs(selected_nodes) do
                -- Find and close buffer for each file before trashing
                local bufnr = vim.fn.bufnr(node.path)
                if bufnr > 0 and vim.api.nvim_buf_is_loaded(bufnr) then
                  vim.api.nvim_buf_delete(bufnr, { force = true })
                end
                
                vim.fn.system({ "trash", vim.fn.fnameescape(node.path) })
              end
              require("neo-tree.sources.manager").refresh(state.name)
            end)
          end,
        },
      },
      default_component_configs = {
        indent = {
          padding = 0,
          with_expanders = true,
          expander_collapsed = "",
          expander_expanded = "",
        },
      },
    })

    -- Key mapping to toggle Neo-tree
    vim.keymap.set("n", "<leader>e", function()
      require("neo-tree.command").execute({
        toggle = true,
        position = "left",
      })
    end)

    -- Autocmd to open Neo-tree in the current window if opening Neovim with a directory
    vim.api.nvim_create_autocmd("VimEnter", {
      callback = function()
        local arg = vim.fn.argv(0)
        if vim.fn.isdirectory(arg) == 1 then
          require("neo-tree").setup({
            window = {
              position = "current",
            },
          })
          vim.cmd("Neotree reveal")
        end
      end,
    })
  end,
}
