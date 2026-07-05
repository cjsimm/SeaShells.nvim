local colors = require("SeaShells.colors")
local theme = require("SeaShells.theme")

local M = {}

local terminal_colors = {
    colors.normal.black,
    colors.normal.red,
    colors.normal.green,
    colors.normal.yellow,
    colors.normal.blue,
    colors.normal.magenta,
    colors.normal.cyan,
    colors.normal.white,
    colors.bright.black,
    colors.bright.red,
    colors.bright.green,
    colors.bright.yellow,
    colors.bright.blue,
    colors.bright.magenta,
    colors.bright.cyan,
    colors.bright.white,
}

-- loop through the highlights set by the theme and apply to nvim
function M.set_highlights(highlights)
    for group, style in pairs(highlights) do
        vim.api.nvim_set_hl(0, group, style)
    end
end

function M.set_terminal_colors()
    for index, color in ipairs(terminal_colors) do
        vim.g["terminal_color_" .. (index - 1)] = color
    end
end

-- Entry point to apply the configured theme to nvim. Called by the /colors/SeaShells.lua module
function M.load()
    if vim.g.colors_name then
        vim.cmd("hi clear")
    end

    vim.o.termguicolors = true
    M.set_highlights(theme.setup())
    M.set_terminal_colors()
    vim.g.colors_name = "SeaShells"
end

return M
