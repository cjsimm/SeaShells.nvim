local theme = require("theme")

local M = {
}

-- loop through the highlights set by the theme and apply to nvim
function M.set_highlights(highlights)
    for group, style in highlights do
        vim.api.nvim_set_hl(0, group, style)
    end
end

-- Entry point to apply the configured theme to nvim. Called by the /colors/SeaShells.lua module
function M.load()
    if vim.g.colors_name then
        vim.cmd("hi clear")
    end
    M.set_highlights(theme.setup())
    vim.o.termguicolors = true
    vim.g.colors_name = "SeaShells"
end

return M
