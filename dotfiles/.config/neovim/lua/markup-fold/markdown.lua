local api = vim.api
local misc = require('markup-fold.misc')

local header_regex = '^#\\+\\s\\w\\+'

local function header_level(lnum)
    local line = misc.get_line(lnum)
    local count = 0
    local line_length = string.len(line)
    if line_length < 2 then
        return 0
    end
    for i = 1, line_length do
        if string.sub(line, i, i) == '#' then
            count = count + 1
        else
            return count
        end
    end
end

return {
    level = header_level,
    regex = header_regex
}
