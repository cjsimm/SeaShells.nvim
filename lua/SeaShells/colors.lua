local M = {}

M.palette = {
    abyss = "#09141b",
    deep_abyss = "#08131a",
    midnight = "#0f2635",
    ink = "#17384c",
    tide = "#1e4950",
    harbor = "#1e4962",
    slate = "#434b53",
    kelp = "#027c9b",
    sea_glass = "#50a3b5",
    mist = "#87acb4",
    weathered_teal = "#628d98",
    surf = "#1bbcdd",
    foam = "#68d4f1",
    seafoam = "#bbe3ee",
    coral = "#d15123",
    washed_coral = "#d48678",
    amber = "#fca02f",
    sand = "#deb88d",
    driftwood = "#c9a37b",
    shell_shadow = "#a98d6d",
    shell = "#fee4ce",
    sunwash = "#fdd39f",

    -- new
    eelgrass = "#8aa85f",
    reef_red = "#e5484d",
    deep_plum = "#6e4a73",
    plum_shell = "#a87eb7",
    mauve_pearl = "#d6b7c8",

    -- diff coloring
    diff_add = "#0b3b43",
    diff_change = "#183850",
    diff_delete = "#4b241f",
    diff_text = "#245164",
}

M.cursor = {
    cursor = M.palette.amber,
    text   = M.palette.deep_abyss,
}

M.selection = {
    background = M.palette.harbor,
    text       = M.palette.shell,
}

M.misc = {
    none = "NONE",
}

M.ansi = {
    normal = {
        black   = M.palette.ink,
        red     = M.palette.coral,
        green   = M.palette.kelp,
        yellow  = M.palette.amber,
        blue    = M.palette.tide,
        magenta = M.palette.foam,
        cyan    = M.palette.sea_glass,
        white   = M.palette.sand,
    },
    bright = {
        black   = M.palette.slate,
        red     = M.palette.washed_coral,
        green   = M.palette.weathered_teal,
        yellow  = M.palette.sunwash,
        blue    = M.palette.surf,
        magenta = M.palette.seafoam,
        cyan    = M.palette.mist,
        white   = M.palette.shell,
    },
}

M.ui = {
    bg0 = M.palette.abyss,
    bg1 = M.palette.midnight,
    bg2 = M.palette.ink,
    bg3 = M.palette.harbor,
    bg4 = M.palette.slate,
    fg0 = M.palette.shell,
    fg1 = M.palette.sand,
    fg2 = M.palette.driftwood,
    fg3 = M.palette.shell_shadow,
    border = M.palette.tide,
}

M.diff = {
    add    = M.palette.diff_add,
    change = M.palette.diff_change,
    delete = M.palette.diff_delete,
    text   = M.palette.diff_text,
}

return M
