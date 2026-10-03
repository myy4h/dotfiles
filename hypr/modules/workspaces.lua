local monitors = require("var.monitors")
local main = monitors.main.output
local left = monitors.left.output

for i = 1, 7 do
    hl.workspace_rule({ workspace = tostring(i), monitor = main, default = i == 1, persistent = true })
end

for i = 8, 10 do
    hl.workspace_rule({ workspace = tostring(i), monitor = left, default = i == 8, persistent = true })
end

hl.workspace_rule({ workspace = "name:game", monitor = main, default = false, persistent = false })
hl.workspace_rule({ workspace = "name:dev", monitor = main, default = false, persistent = false })
