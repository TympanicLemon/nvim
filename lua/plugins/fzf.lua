return {
  "ibhagwan/fzf-lua",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    require("fzf-lua").setup({})

    local map = function(keymap, cmd, desc, mode)
      mode = mode or "n"
      vim.keymap.set(mode, keymap, cmd, { desc = desc })
    end

    local fzf = require("fzf-lua")

    map("<leader><leader>", fzf.files, "Find files")
    map("<leader>fh", fzf.helptags, "Find help tags")
    map("<leader>ff", fzf.files, "Find files fzf")
    map("<leader>fw", fzf.grep_cword, "Find word (under cursor)")
    map("<leader>fg", fzf.live_grep, "Live grep")
    map("<leader>fG", fzf.git_status, "Search git status")

    local config = require("fzf-lua.config")
    local actions = require("trouble.sources.fzf").actions
    config.defaults.actions.files["ctrl-t"] = actions.open
  end,
}
