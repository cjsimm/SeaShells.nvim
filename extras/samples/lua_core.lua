-- Lua syntax showcase: tables, functions, metatables, loops, and pattern matching.

local Shell = {}
Shell.__index = Shell

local DEFAULT_TAGS = { "sea", "shell", "theme" }

function Shell.new(name, colors)
    return setmetatable({
        name = name or "unknown",
        colors = colors or {},
        tags = DEFAULT_TAGS,
    }, Shell)
end

function Shell:label()
    return ("%s (%d colors)"):format(self.name, #self.colors)
end

local palette = {
    background = "#09141b",
    foreground = "#deb88d",
    accent = "#fca02f",
    active = true,
}

local function iter_colors(colors)
    local index = 0
    return function()
        index = index + 1
        return colors[index]
    end
end

for key, value in pairs(palette) do
    if type(value) == "string" and value:match("^#%x%x%x%x%x%x$") then
        print(("color %-10s = %s"):format(key, value))
    elseif value == true then
        print(key .. " is enabled")
    else
        print("ignored", key, value)
    end
end

local shell = Shell.new("SeaShells", { palette.background, palette.foreground, palette.accent })

for color in iter_colors(shell.colors) do
    print(shell:label(), color)
end

return Shell
