local misc = require('markup-fold.misc')

local section_regex = '^\\\\\\(sub\\)*section'

local function section_level(lnum)
    local line = misc.get_line(lnum)
    local re = vim.regex(section_regex)
    if re:match_str(line) then
        local count = 1
        for i = 2, string.len(line),3 do
            if string.sub(line, i, i+2) == "sub" then
                count = count + 1
            else
                return count
            end
        end
    end
    return 0
end

return {
    level = section_level,
    regex = section_regex
}
