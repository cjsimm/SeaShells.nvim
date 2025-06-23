local M = {}

M.base = {
    -- Need to align the two sections below. Find more SS palette colours
    -- seashells versio
    bg0_ss  = '#09141b',
    fg0_ss  = '#deb88d',

    -- neosolarized style
    base1       = '#93a1a1',
    base2       = '#eee8d5',
    base3       = '#fdf6e3',
    bg0         = '#002b36',
    bg1         = '#073642',
    bg2         = '#002b36',
    bg_red      = '#da0000',
    bg_green    = '#859000',
    bg_yellow   = '#b59900',
    fg0         = '#839496',
    fg1         = '#657b83',
    fg2         = '#586e75',
}

M.cursor = {
    cursor      = '#fca02f',
    text        = '#08131a',
}

M.selection = {
    background  = '#1e4962',
    text        = '#fee4ce',
}

M.misc = {
    none        = "NONE",
}

M.diff = {
    -- this is entirely neosolarized
    add         = '#003200',
    change      = '#323200',
    delete      = '#320000',
    text        = '#404000',
}

M.normal = {
    black       = '#17384c',
    blue        = '#1e4950',
    cyan        = '#50a3b5',
    green       = '#027c9b',
    magenta     = '#68d4f1',
    red         = '#d15123',
    white       = '#deb88d',
    yellow      = '#fca02f',
}

M.bright = {
    black       = '#434b53',
    blue        = '#1bbcdd',
    cyan        = '#87acb4',
    green       = '#628d98',
    magenta     = '#bbe3ee',
    red         = '#d48678',
    white       = '#fee4ce',
    yellow      = '#fdd39f',
}

return M
