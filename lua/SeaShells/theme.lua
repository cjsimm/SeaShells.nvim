local c = require("colors")

local M = {}

-- Colour palette notes:
-- red light blue , yellow/orange for highlights and syntax/keywords
-- orange for keys in k:v pairs
function M.setup()
    local config = require("config")
    local theme = {
        -- k : v / highlight-group  :
        highlights = {
            Cursor = {}
        },

    }
    return theme
end

-- • {val}    Highlight definition map, accepts the following keys:
--            • fg: color name or "#RRGGBB", see note.
--            • bg: color name or "#RRGGBB", see note.
--            • sp: color name or "#RRGGBB"
--            • blend: integer between 0 and 100
--            • bold: boolean
--            • standout: boolean
--            • underline: boolean
--            • undercurl: boolean
--            • underdouble: boolean
--            • underdotted: boolean
--            • underdashed: boolean
--            • strikethrough: boolean
--            • italic: boolean
--            • reverse: boolean
--            • nocombine: boolean
--            • link: name of another highlight group to link to, see
--              |:hi-link|.
--            • default: Don't override existing definition |:hi-default|
--            • ctermfg: Sets foreground of cterm color |ctermfg|
--            • ctermbg: Sets background of cterm color |ctermbg|
--            • cterm: cterm attribute map, like |highlight-args|. If not
--              set, cterm attributes will match those from the attribute
--              map documented above.
--            • force: if true force update the highlight group when it
--              exists.


return M
