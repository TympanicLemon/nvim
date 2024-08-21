local M = {}

local uv = vim.uv

function M.find_project_root(start_dir)
    local dir = start_dir or uv.cwd()
    local search_patterns = { ".git" }

    while dir do
        for _, pattern in ipairs(search_patterns) do
            local path = dir .. "/" .. pattern
            if uv.fs_stat(path) then
                return dir
            end
        end

        local parent_dir = uv.fs_realpath(dir .. "/..")
        if parent_dir == dir then
            break
        end
        dir = parent_dir
    end

    return uv.cwd()
end

function M.get_relative_path_to_file(root_dir)
    local file_path = vim.fn.expand("%:p")

    if file_path:sub(1, #root_dir) == root_dir then
        local relative_path = file_path:sub(#root_dir + 2)
        return relative_path
    else
        return file_path
    end
end

return M
