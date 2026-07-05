local M = {}

M.primary = {
    background = "#09141b",
    foreground = "#deb88d",
}

M.cursor = {
    cursor = "#fca02f",
    text   = "#08131a",
}

M.selection = {
    background = "#1e4962",
    text       = "#fee4ce",
}

M.misc = {
    none = "NONE",
}

M.normal = {
    black   = "#17384c",
    blue    = "#1e4950",
    cyan    = "#50a3b5",
    green   = "#027c9b",
    magenta = "#68d4f1",
    red     = "#d15123",
    white   = "#deb88d",
    yellow  = "#fca02f",
}

M.bright = {
    black   = "#434b53",
    blue    = "#1bbcdd",
    cyan    = "#87acb4",
    green   = "#628d98",
    magenta = "#bbe3ee",
    red     = "#d48678",
    white   = "#fee4ce",
    yellow  = "#fdd39f",
}

M.ui = {
    bg0 = M.primary.background,
    bg1 = "#0f2635",
    bg2 = M.normal.black,
    bg3 = M.selection.background,
    bg4 = M.bright.black,
    fg0 = M.bright.white,
    fg1 = M.primary.foreground,
    fg2 = "#c9a37b",
    fg3 = "#a98d6d",
    border = M.normal.blue,
}

M.diff = {
    add    = "#0b3b43",
    change = "#183850",
    delete = "#4b241f",
    text   = "#245164",
}

return M
