local api = vim.api

local function get_line(lnum)
    return api.nvim_buf_get_lines(0, lnum-1, lnum, false)[1]
end

local function get_previous(lnum, pattern)
    local re = vim.regex(pattern)
    local lines = api.nvim_buf_get_lines(0, 0, lnum, false)
    for i = lnum-1,1,-1 do
        if re:match_str(lines[i] ) then
            return i
        end
    end
    return -1
end

local function get_next(lnum, pattern)
    local re = vim.regex(pattern)
    local linecount = api.nvim_buf_line_count(0)
    local lines = api.nvim_buf_get_lines(0, lnum, linecount+1, false)
    for i = 1, linecount-lnum, 1 do
        if re:match_str(lines[i]) then
            return i+lnum
        end
    end
    return -1
end

return {
    get_next = get_next,
    get_previous = get_previous,
    get_line = get_line
}
