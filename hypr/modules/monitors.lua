local monitors = require("var.monitors")

hl.monitor({ output = monitors.main.output, mode = monitors.main.mode, position = "0x0", scale = 1, vrr = 2 })
hl.monitor({ output = monitors.left.output, mode = monitors.left.mode, position = "-1920x0", scale = 1 })
