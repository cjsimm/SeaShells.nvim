-- Neovim Lua syntax showcase: modules, highlight maps, callbacks, and pcall.

local M = {}

local groups = {
    Normal = { fg = "#deb88d", bg = "#09141b" },
    Cursor = { fg = "#08131a", bg = "#fca02f" },
    Visual = { fg = "#fee4ce", bg = "#1e4962" },
}

local function apply_highlight(group, style)
    local ok, err = pcall(vim.api.nvim_set_hl, 0, group, style)
    if not ok then
        vim.notify(("failed to set %s: %s"):format(group, err), vim.log.levels.WARN)
    end
    return ok
end

function M.setup(options)
    options = vim.tbl_deep_extend("force", {
        transparent = false,
        on_apply = function(group)
            return group
        end,
    }, options or {})

    for group, style in pairs(groups) do
        local next_style = vim.deepcopy(style)
        if options.transparent and group == "Normal" then
            next_style.bg = "NONE"
        end

        apply_highlight(options.on_apply(group), next_style)
    end
end

vim.api.nvim_create_user_command("SeaShellsSample", function(args)
    local bang = args.bang and "!" or ""
    print("SeaShellsSample" .. bang, args.args)
end, {
    bang = true,
    nargs = "*",
    desc = "Exercise command callback syntax for theme testing",
})

return M
