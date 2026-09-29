local mainMod = "SUPER"

local terminal = "kitty"
local browser = "helium"

--mimic minimized
hl.bind(mainMod .. " + X", function()
    if hl.get_workspace("special:minimized") then
        hl.dispatch(hl.dsp.window.move({ workspace = hl.get_active_workspace(), window = "tag:minimized" }))
        hl.dispatch(hl.dsp.window.clear_tags({ window = "tag:minimized" }))
    else
        hl.dispatch(hl.dsp.window.tag({ tag = "minimized", window = hl.get_active_window() }))
        hl.dispatch(hl.dsp.window.move({ workspace = "special:minimized", follow = false }))
    end
end)

hl.bind(mainMod .. " + F", hl.dsp.exec_cmd(terminal))
hl.bind(mainMod .. " + Q", hl.dsp.exec_cmd(browser))
hl.bind("ALT + SPACE", hl.dsp.exec_cmd("exec fuzzel"))
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd("kitty yazi"))



local closeWindowBind = hl.bind(mainMod .. " + C", hl.dsp.window.close())
-- closeWindowBind:set_enabled(false)
hl.bind(mainMod .. " + M",
    hl.dsp.exec_cmd("command -v hyprshutdown >/dev/null 2>&1 && hyprshutdown || hyprctl dispatch 'hl.dsp.exit()'"))
hl.bind(mainMod .. " + V", hl.dsp.window.float({ action = "toggle" }))

hl.bind(mainMod .. " + J", hl.dsp.layout("togglesplit")) -- dwindle only

hl.bind(mainMod .. " + SHIFT + S", hl.dsp.exec_cmd("exec hyprshot -m region --clipboard-only"))
hl.bind("PRINT", hl.dsp.exec_cmd("exec hyprshot -m output"))

-- Scroll through existing workspaces with mainMod + scroll
hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + mouse_up", hl.dsp.focus({ workspace = "e-1" }))

-- Move/resize windows with mainMod + LMB/RMB and dragging
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })



-- Move focus with mainMod + arrow keys
hl.bind(mainMod .. " + left", hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + right", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + up", hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + down", hl.dsp.focus({ direction = "down" }))


local wsKeys = {
    [1] = "ampersand",
    [2] = "eacute",
    [3] = "quotedbl",
    [4] = "apostrophe",
    [5] = "parenleft",
    [6] = "minus",
    [7] = "egrave",
    [8] = "underscore",
    [9] = "ccedilla",
    [10] = "agrave",
}

for i = 1, 10 do
    local key = wsKeys[i]
    hl.bind(mainMod .. " + " .. key, hl.dsp.focus({ workspace = i }))
    hl.bind(mainMod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i }))
end
