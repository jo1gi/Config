local misc = require('markup-fold.misc')

local function get_fold(lang, lnum)
    local data = require('markup-fold.'..lang)
    local levelfn, regex = data["level"], data["regex"]
    local level = levelfn(lnum)
    if level > 0 then
        return '>'..level
    end
    local last_header = misc.get_previous(lnum, regex)
    if last_header > 0 then
        return levelfn(last_header)
    end
    return 0
end

return get_fold
